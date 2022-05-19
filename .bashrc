# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export JAVA_HOME=/home/soumava/Development/jdk-18.0.1.1
PATH="$PATH:$HOME/Development/flutter/bin:$HOME/.emacs.d/bin:$JAVA_HOME/bin/"

export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

unset rc
source ~/.bash_completion/alacritty
eval "$(starship init bash)"
