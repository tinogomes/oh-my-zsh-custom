function show_processes() {
    if (($# == 0)); then
        ps -ef
    else
        echo "  UID   PID  PPID   C     STIME TTY           TIME CMD"
        ps -ef | grep $*
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

