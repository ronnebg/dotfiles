# Reset
Color_Off='\033[0m'       # Text Reset

RdTrain_Color="\033[0;101m\033[1;97m"        #Bold Red


TrdDev_Color="\033[1;31m"        #Bold Red
MacBook_Color="\033[38;5;208m"  #Orange
Solaris_Color="\033[0;93m"          #Yellow
Linux_Color="\033[0;96m"          #Cyan
IBM_Color="\033[0;95m"            #Purple
VM_Color="\033[0;34m"        #Bold Red


function getHostNameColor()
{
    if [ $(whoami) = "rdtrain" ]
    then
        echo -e "${RdTrain_Color}[rdtrain]${Color_Off}"
    elif [ $HOSTNAME = "tdolnydtrnvm01" -o $HOSTNAME = "tdolnjdtrnvm01" ] 
    then 
        echo -e  ${TrdDev_Color}
    elif [ "$IS_VM" != "" ] 
    then 
        echo -e  ${VM_Color}
    elif [ $HOSTNAME = "DR-MacBook" ] 
    then 
        echo -e  ${MacBook_Color}
    else
        case $OSTYPE in    
            Linux)     
              echo -e ${Linux_Color}
              ;;    
            SunOS)     
              echo -e ${Solaris_Color}
              ;;    
            AIX)     
              echo -e ${IBM_Color}
              ;;    
            *)    
              echo -e ${Color_Off}
              ;;    
        esac    
    fi
}





#ALIASES

    alias rdt="sudo -i -H -u rdtrain /opt/bb/bin/bash"

    alias rm="rm -i"
    alias ls="ls -p"
    alias vi="vim"
    alias more="less"

    alias gl='git log --date=relative --pretty="%C(cyan)%>(15)%cd %C(yellow)%h %Creset%s" '
    alias git_last_branch_commit='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r'


    alias dev_proxy='http_proxy=http://bproxy.tdmz1.bloomberg.com:80 https_proxy=http://bproxy.tdmz1.bloomberg.com:80'
    alias ext_proxy='http_proxy=http://proxy.bloomberg.com:77 https_proxy=http://proxy.bloomberg.com:77'

    alias print_src="a2ps -1 --line-numbers=1" 
    alias print_src_color="a2ps -1 --pro=color --line-numbers=1 "


    alias green_font="echo -e \"\e[32m\" "
    alias white_font="echo -e \"\e[0;37m\" "
    alias cyan_font="echo -e \"\e[0;36m\" "
    alias reset_font="echo -e \"\e[0m\" "

    alias update_time="sudo ntpdate -u time.apple.com"
alias preview_README='ext_proxy grip README.md -b --user drdev@ronneburger-family.net --pass Jul98aseb'
alias preview_md='ext_proxy grip -b --user drdev@ronneburger-family.net --pass Jul98aseb'

alias bipe='docker run -ti -v `pwd`:/PROJECT bi-python-env bash'


# SHELL EDITING OPTIONS
    set -o vi

    export TRNDEV1='tdolnydtrnvm01'
    export TRNDEV2='tdolnjdtrnvm01'
    export LXVM='172.16.83.130'


    export BIDEV1="rdalnjdrdbap01"
    export BIDEV2="rdalnydrdbap01"

    alias sshdevbi1="ssh -X $BIDEV1"
    alias sshdevbi2="ssh -X $BIDEV2"
    #alias sshdevbi1="ssh -tt v5dev inline $BIDEV1"
    #alias sshdevbi2="ssh -tt v5dev inline $BIDEV2"

    alias sshdev="ssh -X -tt v5dev inline"
    alias sshprod="ssh -X -tt v5prod inline"



    alias devsshkey='ssh-add ~/.toolkit/toolkit_ssh_key_dronnebu'

    alias lxvm="ssh dronnebu@${LXVM}"
    alias VM="cd ~/VAGRANT-BOX; vagrant ssh"



# SETTING PROMPT
    case $TERM in
        xterm*)
            PS1='$( echo -e "\["`getHostNameColor`"\]\h:../\W/>\[${Color_Off}\] ")'
            PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
            ;;
        screen*)
            PS1='$( echo -e "\["`getHostNameColor`"\]\h:../\W/>\[${Color_Off}\] ")'
            ;;
        *)
            PS1='\h:../\W/>"'
            ;;
    esac


# SETTING VAR WITH TRAINING LOCATION
    T=/bbsrc/training

. ~/bin/git-completion.sh


  

