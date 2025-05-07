# White Rabbit Dark - Terminal Color Configuration

# Enable colorized output for ls on macOS
export CLICOLOR=1

# White Rabbit Dark inspired colors for ls
# Format is: directory, symlink, socket, pipe, executable, block special, character special, 
# executable with setuid, executable with setgid, dir with sticky, dir without sticky
export LSCOLORS="gxfxcxdxbxegedabagacad"

# For GNU ls (if installed via homebrew)
export LS_COLORS="di=32:ln=35:so=33:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Colored grep output
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="32"  # Green for matches

# Colored man pages using less
export LESS_TERMCAP_mb=$'\E[01;32m'      # begin blinking - bright green
export LESS_TERMCAP_md=$'\E[01;32m'      # begin bold - bright green
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
export LESS_TERMCAP_so=$'\E[30;42m'      # begin standout-mode - black on green
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[04;32m'      # begin underline - underlined green

# Make `tree` command output colorful
export TREE_COLORS="di=32:ln=35:so=33:pi=33:ex=31:bd=34;46:cd=34;43"
alias tree="tree -C"

# Aliases for colorized output
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Use enhanced ls command if exa is installed
if command -v exa &> /dev/null; then
    alias ls="exa --color=always --group-directories-first"
    alias ll="exa -l --color=always --group-directories-first"
    alias la="exa -la --color=always --group-directories-first"
fi
