function show_processes() {
    if (($# == 0)); then
        ps -ef
    else
        echo "  UID   PID  PPID   C     STIME TTY           TIME CMD"
        ps -ef | grep -v grep | grep $*
    fi
}

alias psg=show_processes

function pause() {
    echo 'Press [Enter] key to continue...'
    read -s
}

function p80 () {
    printf "%080d\n" | tr 0 "*"
    if [ ! -z "$*" ]; then
        echo $*
        printf "%080d\n" | tr 0 "*"
    fi
}

function lock() {
    open -a ScreenSaverEngine
}

function md5 () {
  echo -n $1 | md5sum | cut -d ' ' -f 1 | pbcopy
}

function open_editor() {
    if (($# == 0)); then
        subl .
    else
        subl $*
    fi
}

alias e=open_editor

export PROJECTS_PATH="$HOME/Projects"
export CDPATH=.:~:$PROJECTS_PATH

# Always create $PROJECTS_PATH directory at HOME
if [[ ! -d "$PROJECTS_PATH" ]]; then
    mkdir "$PROJECTS_PATH"
fi

alias p='cd $PROJECTS_PATH'

alias faggy='say -v Good\ News faggy faggy faggy faggy faggy faggy faggy faggy'
alias galias='alias | grep'
alias reload="source ~/.zshrc"
alias ssh-key-copy="cat ~/.ssh/id_rsa.pub | pbcopy"
alias ssh-list='cat ~/.ssh/config'
alias traling-spaces="sed -i '' 's/[[:space:]]\{1,\}$//'"
