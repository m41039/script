# encoding=UTF8
import re

pattenNagiosError = re.compile("^([SD|IDC]+-Nagios)-([a-zA-Z0-9]+)-(.+)-at-([0-9:]+) - (.+)")
pattenJblogError = re.compile("^(.+),Jblog,,([a-zA-Z]+),(.+) - (.+)")

with open('slack_api_log.txt') as fp:
    for line in fp:
        pattenNagiosMatch = pattenNagiosError.match(line)
        pattenJblogMatch = pattenJblogError.match(line)
        if line != '\n':
            if pattenNagiosMatch:
                nagiosName = pattenNagiosMatch.group(1)
                serverName = pattenNagiosMatch.group(2)
                errorMsg = pattenNagiosMatch.group(3)
                time = pattenNagiosMatch.group(4)
                errorDetailMsg = pattenNagiosMatch.group(5)
                print nagiosName, " (>_<) server: ", serverName, ", time: ", time, "error: ", errorMsg, "\n Detail error msg: ", errorDetailMsg 
            
            elif pattenJblogMatch:
                time = pattenJblogMatch.group(1)
                env = pattenJblogMatch.group(2)
                host = pattenJblogMatch.group(3)
                errorMsg = pattenJblogMatch.group(4)

                print "env: ", env, " Datetime: ", time, "host: ", host, "errorMsg: ", errorMsg







