#!/bin/bash


# history
shopt -s histappend
HISTCONTROL="ignoreboth:erasedups"
HISTTIMEFORMAT='%F %T  '
HISTIGNORE="ls:ll:exit:history:clear:pwd:date:* --help:man *:which *:whereis *"