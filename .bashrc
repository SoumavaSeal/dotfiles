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

path_append() { 
    case ":$PATH:" in
        *":$1:"*) ;; # already in PATH 
        *) PATH="$1:$PATH" ;; 
    esac 
}

# export JAVA_HOME=/home/soumava/Dev/devtools/jdk-21.0.1
# export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
export JAVA_HOME=/home/soumava/Dev/devtools/jdk-24.0.2
export FLUTTER_HOME=/home/soumava/Dev/devtools/flutter
export ANDROID_HOME=/home/soumava/Dev/devtools/ANDROID

# PATH="$FLUTTER_HOME/bin:$HOME/.emacs.d/bin:$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin/:$ANDROID_HOME/emulator/:$PATH"
path_append "$FLUTTER_HOME/bin"
path_append "$HOME/.emacs.d/bin"
path_append "$JAVA_HOME/bin"
path_append "$ANDROID_HOME/cmdline-tools/latest/bin" 
path_append "$ANDROID_HOME/emulator"

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
# source ~/.bash_completion/alacritty
eval "$(starship init bash)"
