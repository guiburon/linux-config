# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
plugins=(git fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh//.p10k.zsh.
[[ ! -f ~/.config/zsh//.p10k.zsh ]] || source ~/.config/zsh//.p10k.zsh

# ======================================================
# ======================== user ========================
# ======================================================
# see .zshenv for PATH

# ---------------------------------
# ------------ aliases ------------
# ---------------------------------
# --- wifi ---
alias wifienable="iwctl device $WIFI_DEVICE set-property Powered on; iwctl adapter $WIFI_ADAPTER set-property Powered on; iwctl device list; iwctl adapter list"
alias wifidisable="iwctl device $WIFI_DEVICE set-property Powered off; iwctl adapter $WIFI_ADAPTER set-property Powered off; iwctl device list; iwctl adapter list"
alias wifico="iwctl station $WIFI_DEVICE connect $WIFI_SSID_HOME"
alias wifidisco="iwctl station $WIFI_DEVICE disconnect"
alias wifistatus="iwctl station $WIFI_DEVICE show"
# --- Emacs ---
alias emacsserver="emacs --daemon&"
alias kill-emacs="emacsclient -e '(kill-emacs)'"
alias ec="emacsclient -c -a emacs&"

# --- kitty ---
alias icat="kitty +kitten icat"	# image viewer

# # --- Private Internet Access ---
# alias piaenable="piactl background enable"
# alias piadisable="piactl background disable"
# alias piaco="piactl connect"
# alias piadeco="piactl disconnect"
# alias piastatus="piactl get connectionstate"
# alias piaregion="piactl get region"

# --- Qtile ---
alias qtile-reload="qtile cmd-obj -o cmd -f reload_config"	# mod+ctrl+r with default Qtile keybindings
alias qtile-restart="qtile cmd-obj -o cmd -f restart"
alias qtile-log="cat ~/.local/share/qtile/qtile.log"

# --- Misc ---
alias brave="brave --password-store=basic"	# disable wallet popup
alias cat="bat"
alias ls="exa -la --group-directories-first --color=always"
alias resource="source $ZDOTDIR/.zshrc"

# ---------------------------------
# ------------ startup ------------
# ---------------------------------
# --- keybindings ---
bindkey -v	# vi mode

# --- start ssh-agent ---
eval `ssh-agent -s`
# load private key for guiburon@github.com on guiburon-linux
ssh-add ~/.ssh/github
# clear print of ssh-agent
clear

# --- cosmetic ---
neofetch

