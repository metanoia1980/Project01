###########################################
##  _                   _                ##
## | |                 | |               ##
## | |___  ___ _  _____| |__  _ ___ ___  ##
## | / _ \/ _ \ |/ ___ |  _ \| '__ / __| ##
## |  |_|  |_|  |\____ \ | | | |  | |__  ##
## |_\___/\___/_|\_____/_| |_|_|   \___| ##
##                                       ##
###########################################

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac


iatest=$(expr index "$-" i)
# Ignore case on auto-completion.
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi


# Show auto-completion list automatically, without double tab.
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi


# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=erasedups:ignoredups:ignorespace


# Append to the history file, don't overwrite it.
shopt -s histappend
PROMPT_COMMAND='history -a'


# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
HISTSIZE=1000
HISTFILESIZE=2000


# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize


# Colorful ls output and aliases.
if [ -x /usr/bin/dircolors ]; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi


# Color settings for grep commands.
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=38;5;219:01:ex=32:*.tar=38;5;219:*.tgz=38;5;219:*.arc=38;5;219:*.arj=38;5;219:*.taz=38;5;219:*.lha=38;5;219:*.lz4=38;5;219:*.lzh=38;5;219:*.lzma=38;5;219:*.tlz=38;5;219:*.txz=38;5;219:*.tzo=38;5;219:*.t7z=38;5;219:*.zip=38;5;219:*.z=38;5;219:*.dz=38;5;219:*.gz=38;5;219:*.lrz=38;5;219:*.lz=38;5;219:*.lzo=38;5;219:*.xz=38;5;219:*.zst=38;5;219:*.tzst=38;5;219:*.bz2=38;5;219:*.bz=38;5;219:*.tbz=38;5;219:*.tbz2=38;5;219:*.tz=38;5;219:*.deb=38;5;219:*.rpm=38;5;219:*.jar=38;5;219:*.war=38;5;219:*.ear=38;5;219:*.sar=38;5;219:*.rar=38;5;219:*.alz=38;5;219:*.ace=38;5;219:*.zoo=38;5;219:*.cpio=38;5;219:*.7z=38;5;219:*.rz=38;5;219:*.cab=38;5;219:*.wim=38;5;219:*.swm=38;5;219:*.dwm=38;5;219:*.esd=38;5;219:*.jpg=38;5;228:*.jpeg=38;5;228:*.mjpg=38;5;228:*.mjpeg=38;5;228:*.gif=38;5;228:*.bmp=38;5;228:*.pbm=38;5;228:*.pgm=38;5;228:*.ppm=38;5;228:*.tga=38;5;228:*.xbm=38;5;228:*.xpm=38;5;228:*.tif=38;5;228:*.tiff=38;5;228:*.png=38;5;228:*.svg=38;5;228:*.svgz=38;5;228:*.mng=38;5;228:*.pcx=38;5;228:*.mov=38;5;228:*.mpg=38;5;228:*.mpeg=38;5;228:*.m2v=38;5;228:*.mkv=38;5;228:*.webm=38;5;228:*.ogm=38;5;228:*.mp4=38;5;228:*.m4v=38;5;228:*.mp4v=38;5;228:*.vob=38;5;228:*.qt=38;5;228:*.nuv=38;5;228:*.wmv=38;5;228:*.asf=38;5;228:*.rm=38;5;228:*.rmvb=38;5;228:*.flc=38;5;228:*.avi=38;5;228:*.fli=38;5;228:*.flv=38;5;228:*.gl=38;5;228:*.dl=38;5;228:*.xcf=38;5;228:*.xwd=38;5;228:*.yuv=38;5;228:*.cgm=38;5;228:*.emf=38;5;228:*.ogv=38;5;228:*.ogx=38;5;228:*.aac=36:*.au=36:*.flac=36:*.m4a=36:*.mid=36:*.midi=36:*.mka=36:*.mp3=36:*.mpc=36:*.ogg=36:*.ra=36:*.wav=36:*.oga=36:*.opus=36:*.spx=36:*.xspf=36:'


# Aliases.
alias grep="/usr/bin/grep --color=auto"
alias fgrep="/usr/bin/fgrep --color=auto"
alias egrep="/usr/bin/egrep --color=auto"
alias ls="lsd --group-directories-first" # Requires <apt install lsd> first.
alias ll="lsd -lFh --group-directories-first"
alias la="lsd -AlFh --group-directories-first"
alias l.="la -dAh .*" # Show all hidden only.
alias lst="lsd -Rh"
alias bd='cd "$OLDPWD"' # Back to previous directory.
alias cp="cp -aiv"
alias rm="rm -irv"
alias mv="mv -iv"
alias mkdir="mkdir -p"
alias rsync="rsync -avh"
alias editbash="cd ~ && nano .bashrc"
alias backupbash="rsync ~/.bashrc /media/metanoia/Extreme\ SSD/Documents/Temporary/.bashrc"
alias editnano="cd ~ && nano .nanorc"
alias backupnano="rsync ~/.nanorc /media/metanoia/Extreme\ SSD/Documents/Temporary/.nanorc"
alias tree="tree -CAhF --dirsfirst"
alias ps="ps auxf"
alias less="less -R"
alias cat="batcat"
alias nano="nano -l"
alias df="df -h"
alias du="du -csh"
alias free="free -mth"
alias update="sudo apt update && sudo apt upgrade -y"
alias refresh="source ~/.bashrc"
alias ???="echo $?"


# Copy and go to directory
cpg() {
  if [ -d "$2" ]; then
    cp "$1" "$2" && cd "$2"
  else
    cp "$1" "$2"
  fi
}


# Move and go to directory
mvg() {
  if [ -d "$2" ];then
    mv "$1" "$2" && cd "$2"
  else
    mv "$1" "$2"
  fi
}


# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# Set a fancy prompt (non-color, unless we know we "want" color).
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# Set a custom colorful prompt.
color_prompt=yes
if [[ $color_prompt = yes ]]; then
    # Custom color codes
    bold=$(tput bold)
    red=$(tput setaf 1)
    green=$(tput setaf 2)
    yellow=$(tput setaf 3)
    blue=$(tput setaf 4)
    magenta=$(tput setaf 5)
    cyan=$(tput setaf 6)
    white=$(tput setaf 7)
    reset=$(tput sgr0)

PS1=' \[\e[1;32m\]\u\[\e[m\]\[\e[1;97m\]@\[\e[1;38;5;211m\]\h \[\e[m\]\[\e[1;33m\]\w\[\e[m\]/\[\e[1;32m\]\$\[\e[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi


# Colored GCC warnings and errors.
 export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Enable programmable completion features if not already enabled. This provides auto-completion for commands, options, and filenames.
# The code checks if programmable completion is already enabled by checking the 'posix' shell option. If not, it sources the bash-completion script from either /usr/share/bash-completion/bash_completion or /etc/bash_completion to enable the feature.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Finds directory sizes and lists them for the current directory
dirsize ()
{
du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
egrep '^ *[0-9.]*M' /tmp/list
egrep '^ *[0-9.]*G' /tmp/list
rm -rf /tmp/list
}


# Automatically run ls on directory change.
cd () {
    if [ -n "$1" ]; then
        builtin cd "$@" && ls
    else
        builtin cd ~ && ls
    fi
}


# Extractor for all kinds of archives
# usage: ext <file>
ext ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ext()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Copy file with a progress bar
cpp()
{
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}


# Uncomment for bell sound.
echo -e '\a'


# Uncomment to run Neofetch on terminal startup.
# neofetch

