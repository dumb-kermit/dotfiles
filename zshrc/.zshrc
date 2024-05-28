#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        source "$BASE16_SHELL/profile_helper.sh"
#base16_default
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

autoload -Uz compinit
compinit

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace zsh)
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export TERM="xterm-kitty"

# P10K CONF #
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# BR & YAZI #
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
source /Users/tk_neptune/.config/broot/launcher/bash/br

# COMPLETION #

source /Users/tk_neptune/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/path/to/f-sy-h/F-Sy-H.plugin.zsh

# ZOXIDE & FZF & ATUIN #
eval "$(zoxide init zsh)"
source <(fzf --zsh)
eval "$(atuin init zsh)"

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)              fzf --preview "eza --tree —-color=always {} | head -200" "$@" ;;
        export|unset)    fzf --preview "eval 'echo \$' {}" "$@" ;;
        ssh)             fzf --preview "dig {}"   "$@" ;;
        *)               fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" "$@" ;;
        chafa)           fzf --preview "chafa --clear --size=96x80 {}" "$@" ;;
    esac
}

## ALIASES ##
alias ls="eza -l --all --group-directories-first --color=always --icons=always --no-user --no-permissions --time-style '+%m/%d %H:%M' -h"
alias lt="eza --tree --all -L 1 --group-directories-first --no-user --color=always --no-permissions --time-style '+%m/%d %H:%M' -h"
alias s="eza --tree --all -L 1 --group-directories-first --no-user --icons=always --color=always --no-permissions --time-style '+%m/%d %H:%M' -h"
alias c="eza --tree --all -L 1 --group-directories-first --no-user --icons=always --color=always --no-permissions --time-style '+%m/%d %H:%M' -h"
alias l="eza -l --all --group-directories-first --color=always --no-user --no-permissions --time-style '+%m/%d %H:%M' -h"
alias fm="frogmouth"

alias xnsh="/Users/tk_neptune/Documents/dev/xonsh-env/xbin/xonsh"

alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
#alias zd='fzf --preview="chafa --clear --size=96x80 {} "'
#alias dd="fzf --header 'E to edit' --preview='pistol {}' --bind 'E:execute(vi {})'"

## ENV VARIABLES ##
export PATH="/opt/homebrew/bin:$PATH"
export EDITOR="nvim"
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
export NVIM_APPNAME="nvim"
export LS_COLORS="$(vivid generate ~/Documents/dev/oxo.yml)"
export PATH=$PATH:/Users/tk_neptune/.spicetify
export BAT_THEME="Catppuccin Mocha"

# THE FUCK #
eval $(thefuck --alias f)

# NVIM_APPNAME #
source ~/.zsh/zsh-nvim-appname/zsh-nvim-appname.plugin.zsh
alias nvim='nvapp nvim'
alias nvch='nvapp nvch'

# POST_LOAD #
unalias run-help 2>/dev/null
autoload -U run-help


# FD #
export FZF_DEFAULT_COMMAND="fd —hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
    fd —-hidden —-exclude -git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude -git . "$1"
}

# bun completions
[ -s "/Users/tk_neptune/.bun/_bun" ] && source "/Users/tk_neptune/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
