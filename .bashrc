# Set up hub
eval "$(hub alias -s)"


# ALIASES

# To ignore an alias... (https://remysharp.com/2018/08/23/cli-improved)
# $ \cat # ignore aliases named "cat" - explanation: https://stackoverflow.com/a/16506263/22617
# $ command cat # ignore functions and aliases

alias cat='bat'
alias find='fd'
alias ls='exa --all --long --color-scale --git'

# Quick Tools
alias a="atom ."
alias r="rails"
alias rc="rails c"
alias y="yarn"
alias ys="yarn start"
alias ye="yarn electron"

# A nice shortcut for pushing a WIP to github
alias wip='git aa && git cim "∆" && git push'

# Nicer git stuff
alias g='git'
alias gp='git p'
alias gitp='git p'
alias gs='git s'
alias gits='git s'
alias gaa='git aa'
alias gitaa='git aa'
alias gcim='git cim'
alias gitcim='git cim'
alias gr='git r'
alias gitr='git r'
alias gra='git ra'
alias gitra='git ra'


# PATHS & VARS

# rbenv: To enable shims and autocompletion
eval "$(rbenv init -)"

# Append bins in my home
export PATH="$PATH:~/.bin"

# Append Postgres.app
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export PGDATA="/Users/admin/Library/Application Support/Postgres/var-14"

# We need to prepend bins in homebrew (even though they're already on the PATH by default) so that brew comes before ruby (so we can use dart sass via brew instead of ruby sass)
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Prepend sbins in homebrew
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Prepend npm global
export PATH="$(npm config get prefix):$PATH"

# Prepend bins in the pwd
export PATH=".:$PATH"

# Improve coloring?
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export COLORTERM="24bit"

# Erase duplicates in history
export HISTCONTROL=erasedups

# Store 10k history entries
export HISTSIZE=10000

# Set a minimal prompt
export PS1="\W "

# BASH OPTIONS

# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# Add nice shell titles for Hyper — https://github.com/zeit/hyper/issues/1188#issuecomment-267301723
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                ;;
            *)
                echo -ne "\033]0;${BASH_COMMAND} - ${PWD##*/}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac

# FIN

# Clear the login message
clear
