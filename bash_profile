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

if [ "x${YROOT_NAME}" != "x" ]; then
    prompt="[\u\[\e[1;31m\] @ \[\e[1;32m\]$HOSTPROMPT :: yroot => $YROOT_NAME \[\e[1;33m\]\w\[\e[0;0m\] \d \t]$COL_LASTEXIT\${?#0}\n\[\e[1;37m\]\[\e[0m\]$ ";

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

#alias check6 () { yinst ls -config | grep "requires os"  | awk -F. '{print $1}' | sort -u | awk 'BEGIN {four=0; six=0} /4/ {four++} /6/ {six++} END {if (four>0 && six>0) { print "mixed" } else { if (six>0) { print "six"}; if (four>0) { print "four"}}}'  }

function sshagent_findsockets {
    find /tmp -uid $(id -u) -type s -name agent.\* 2>/dev/null
}

function sshagent_testsocket {
    if [ ! -x "$(which ssh-add)" ] ; then
        echo "ssh-add is not available; agent testing aborted"
        return 1
    fi

    if [ X"$1" != X ] ; then
        export SSH_AUTH_SOCK=$1
    fi

    if [ X"$SSH_AUTH_SOCK" = X ] ; then
        return 2
    fi

    if [ -S $SSH_AUTH_SOCK ] ; then
        ssh-add -l > /dev/null
        if [ $? = 2 ] ; then
            echo "Socket $SSH_AUTH_SOCK is dead!  Deleting!"
            rm -f $SSH_AUTH_SOCK
            return 4
        else
            echo "Found ssh-agent $SSH_AUTH_SOCK"
            return 0
        fi
    else
        echo "$SSH_AUTH_SOCK is not a socket!"
        return 3
    fi
}

function sshagent_init {
    # ssh agent sockets can be attached to a ssh daemon process or an
    # ssh-agent process.

    AGENTFOUND=0

    # Attempt to find and use the ssh-agent in the current environment
    if sshagent_testsocket ; then AGENTFOUND=1 ; fi

    # If there is no agent in the environment, search /tmp for
    # possible agents to reuse before starting a fresh ssh-agent
    # process.
    if [ $AGENTFOUND = 0 ] ; then
        for agentsocket in $(sshagent_findsockets) ; do
            if [ $AGENTFOUND != 0 ] ; then break ; fi
            if sshagent_testsocket $agentsocket ; then AGENTFOUND=1 ; fi
        done
    fi

    # If at this point we still haven't located an agent, it's time to
    # start a new one
    if [ $AGENTFOUND = 0 ] ; then
        eval `ssh-agent`
    fi

    # Clean up
    unset AGENTFOUND
    unset agentsocket

    # Finally, show what keys are currently in the agent
    ssh-add
}

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
