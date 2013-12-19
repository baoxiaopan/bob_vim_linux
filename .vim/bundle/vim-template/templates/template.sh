#! /bin/bash
#****************************************************************#
# ScriptName: %FFILE%
# Descrption: <Description>
# Author: %USER% <%USER%@alibaba-inc.com> - %FDATE%
# Modify Author: %USER%@alibaba-inc.com
# Modify Date: %FDATE%
#****************************************************************#


#----------------------------------------
# Function:  Show usage
# parameter: None
#----------------------------------------
# {{{usage
usage()
{
    yellow "\n${pink}Usage: ${blue}$0 ${green}<PARAM>n"
    yellow "\t<PARAM>: ${brown}\n"
    yellow "\tcmd e.g: ${brown}${blue}$0 ${green}...\n"
    yellow "\n"
    exit 1
}
#----------------------------------------
# }}}


#----------------------------------------
# Function:   Preparation for scripts
# Parameters: 
#----------------------------------------
# {{{Prepare
basedir=`dirname $0`
loglib="$basedir/LOGDOTSH_PATH/log.sh"
[ -f $loglib ] && source $loglib

[ "$1" = "help" -o "$1" = "-help" -o "$1" = "--help" -o "$1" = "-h" ] && usage
[ $# -lt 1 ] && usage
#----------------------------------------
# }}}


# {{{Function
%HERE%
#----------------------------------------
# }}}


#----------------------------------------
# Function:   Main()
# Parameters: 
#----------------------------------------
# {{{Main

#----------------------------------------
# }}}
