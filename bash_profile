#bash_profile
source ~/.bashrc

case $TERM in
 *screen*) export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
   ;;
esac

PRE='\[\033['
POST='m\]'
COL_LASTEXIT="${PRE}01;41;37${POST}"

export TERM=xterm-256color

umask 022

if [ -f /usr/local/etc/bash_completion ]; then
     . /usr/local/etc/bash_completion &>/dev/null
fi

HOSTPROMPT=$(hostname | sed 's/.104.com.tw//g')

host="\[\033[0;32;40m\]\h\[\033[0m\]"
uname=$(uname)
uname2=$(ls /etc/redhat-release  >&  /dev/null && grep -A 1 '\[version\]' /etc/redhat-release | tail -1)

if [ "x${TERM}" = "xxterm-256color" ]; then
        /usr/bin/printf "\033k%s\033\134" ${YROOT_NAME}
 fi
else
    prompt="[\u\[\e[1;31m\] @ \[\e[1;32m\]$HOSTPROMPT \[\e[1;33m\]\w\[\e[0;0m\] \d \t]$COL_LASTEXIT\${?#0}\n\[\e[1;37m\]\[\e[0m\]$ "
    if [ "x${TERM}" = "xxterm-256color" ]; then
        sname=`/bin/hostname | sed 's/\([^\.]*\)\.\([^\.]*\)\(.*\)/\1/'`
        /usr/bin/printf "\033k%s\033\134" ${sname}
    fi
fi

PS1=$uname" "$uname2" "$prompt


# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
#PATH=$PATH:$HOME/bin:/home/y/bin:/home/y/sbin

export PATH

export XMODIFIERS=@im=SCIM    #case matters for this variable!
export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim


# colorful man page
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[38;5;167m'
export LESS_TERMCAP_md=$'\E[38;5;39m'
export LESS_TERMCAP_me=$'\E[38;5;231m'
export LESS_TERMCAP_se=$'\E[38;5;231m'
export LESS_TERMCAP_so=$'\E[38;5;167m'
export LESS_TERMCAP_ue=$'\E[38;5;231m'
export LESS_TERMCAP_us=$'\E[38;5;167m'



alias gl="glances"
alias sagent="sshagent_init"
alias his="history"
alias ta="tmux attach"
alias cdo="cd /opt/"
alias cda="cd /opt/AP"
alias cdp="cd /opt/AP/Patch_program"
alias s="ssh"
alias h="hostname"


function io { iostat  -m -t 2 10 ; }

function md5sig { md5sum /etc/sigsh.pem ; }

function sdu { ls | xargs sudo du -hs ; }

function rlog { $1 | readlog -f date,url,ip,duration,status ; }

function lslisten { netstat -nato | grep LISTEN ; }

function tstart  { sudo /script/tomcat.sh start ; }

function tstop  { sudo /script/tomcat.sh stop ; }

function trestart { sudo /script/tomcat.sh restart ; }

function a10start { sudo /script/_mic/maintain/sigt_allow.sh ; }

function a10stop { sudo /script/_mic/maintain/sigt_deny.sh ; }

function webstart { sudo /opt/httpd/bin/apachectl start ; }

function webstop  { sudo /opt/httpd/bin/apachectl stop ; }

function lpid { ls /opt/AP_INFO/pid ; }
