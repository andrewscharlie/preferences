export PS1="\[\e[0;33m\]\u@\h:\[\e[0;34m\]\w\[\e[0;31m\] >\[\e[0;37m\] "
export PATH=$PATH:/usr/local/go/bin:~/bin:~/gbin
source ~/gbin/change-directory-until

export P4EDITOR='emacsclient -c -n'

alias gcomm='git commit --all --message="`date +"%m-%d-%Y  %r"` Auto-commit";'
alias ge='git commit --all --message="`date +"%m-%d-%Y  %r"` Auto-commit for export to perforce"; git5 export --no-background-upload'
alias gm='git commit --all --message="`date +"%m-%d-%Y  %r"` Auto-commit for git5 mail "; git5 mail'
alias gs="git5 sync"
alias gl="git log --format=oneline"
alias gb="git branch"
alias gco="git checkout"
alias gc="git changes"
alias gca='git commit --all --message="`date +"%m-%d-%Y %r"` commit all"'
alias gp="git p"