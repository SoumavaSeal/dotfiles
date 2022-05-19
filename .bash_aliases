# Text Editors
alias vim='nvim'
#alias emacs='emacs -nw'

# ls commands
alias ll='ls -l'
alias la='ls -al'

# search in the history
alias gh='history | grep'

# Python Virtual enviroment
alias cvenv='python3 -m venv ./venv'
alias avenv='source ./venv/bin/activate'

# Emulators
alias emustart='DRI_PRIME=1 ~/Android/Sdk/emulator/emulator @Pixel_5_API_29'
alias emulist='~/Android/Sdk/emulator/emulator -list-avds'

#ranger
alias r='ranger'

#reload .bashrc
alias reload='source ~/.bashrc'


#pulsemixer
alias pulsemixer='~/Development/pulsemixer'

#Managing dotfiles
alias dotfile='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 
