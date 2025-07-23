
# history
HISTSIZE=100000
SAVEHIST=100000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
HISTORY_IGNORE="(ls|cd|cd *|pwd|l[alsh]|z|tree|exit|history|clear|date|which|whereis)"