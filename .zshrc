# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light Aloxaf/fzf-tab


# Add in snippets
zinit ice wait lucid
zinit snippet OMZP::sudo

# Load completions
autoload -Uz compinit
if [ -f ~/.zcompdump ]; then
    compinit -C
else
    compinit
fi

# To customize prompt, edit ~/.config/oh-my-posh/config.toml
#eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/myconfig.toml)"
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/myconfig.json)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/catpuccin.json)"
#eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/tokyo.json)"

# Keybindings
bindkey "^[[A" history-substring-search-up  # Up arrow
bindkey "^[[B" history-substring-search-down   # Down arrow

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
export PATH=$PATH:/usr/bin
export GDK_BACKEND=wayland
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export ANDROID_HOME=/opt/android-sdk
export PATH=$ANDROID_HOME/tools/bin:$PATH


# Aliases 
alias condastart='source ~/miniconda3/bin/activate && export CONDA_DEFAULT_ENV=$(basename $CONDA_PREFIX)'

# Config colors of search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=cyan,fg=black'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white'

#Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

export PATH="$HOME/flutter/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
