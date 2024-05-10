if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /Users/gurgen/anaconda3/bin/conda
#     eval /Users/gurgen/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# end
# <<< conda initialize <<<

# fish_config theme choose "Dracula Official"
alias s="eza --tree -L 1 --group-directories-first --no-user --no-permissions --time-style '+%m/%d %H:%M' -h --all"
alias l="eza -l --group-directories-first --no-user --no-permissions --time-style '+%m/%d %H:%M' -h --all"
alias ls="eza -l --group-directories-first --no-user --no-permissions --time-style '+%m/%d %H:%M' -h --all"
alias ww="awrit"


function nv-chad
    nvch
end

function nv-stable
    nvimst
end

function nv-lazy
    nlazy
end

function nv-nyom
    nyom
end
function ns
    set items nv-stable nv-chad nv-nyom nv-lazy
    set config (printf "%s\n" $items | fzf --prompt="PICK  CONFIGURATION PACKAGE" --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "NOTHING SELECTED"
        return 0
    else if [ $config = "default" ]
        set config ""
    end
    $config nvim $argv
end

bind f5 ns

export NVIM_APPNAME="nvch"

alias nvimst='NVIM_APPNAME="nvim" nvim'

#alias nks='NVIM_APPNAME="nks" nvim'
alias nvch='NVIM_APPNAME="nvch" nvim'
alias nlazy='NVIM_APPNAME="nlazy" nvim'
alias nyom='NVIM_APPNAME="nyoom" nvim'

#alias ksm='kitty-sesh'
#alias kss='kitty-sesh ss00'

# Base16 Shell
#if status --is-interactive
#    set BASE16_SHELL "$HOME/.config/base16-shell/"
#  source "$BASE16_SHELL/profile_helper.fish"
#end

set hydro_color_prompt #EBC06D
set hydro_color_error D47766
set hydro_color_duration CF9BC2
set hydro_fetch true
set hydro_multiline true
set fish_prompt_pwd_dir_length 4
set hydro_cmd_duration_threshold 10

alias g="fzf --header 'E to edit' --preview='pistol {}' --bind 'E:execute(vi {})'"
#set theme_gruvbox dark soft
alias gogh='bash -c  "$(curl -sLo- https://git.io/vQgMr)"'
#set -U Z_CMD z
set -gx EDITOR nvim
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default underscore
# Set the insert mode cursor to a line
set fish_cursor_insert underscore
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual underscore
# set plugins https://github.com/PatrickF1/fzf.fish
# set plugins https://github.com/kidonng/plug.fish
# set plugins https://github.com/kidonng/zoxide.fish
# source $__fish_user_data_dir/plugins/plug.fish/conf.d/plugin_load.fish

# fzf_configure_bindings --processes='\~' 
# fzf_configure_bindings --variables='\?' 
# fzf_configure_bindings --directory=\F
alias f="fzf-file-widget"
alias ff="_fzf_search_directory"
alias fs="_fzf_search_history"
alias fc="_fzf_search_processes"
alias fv="_fzf_search_variables"

if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end
export CGO_CPPFLAGS="-I /opt/homebrew/include"
export CGO_LDFLAGS="-L /opt/homebrew/lib"

set -l color00 '#161616'
set -l color01 '#262626'
set -l color02 '#393939'
set -l color03 '#525252'
set -l color04 '#dde1e6'
set -l color05 '#f2f4f8'
set -l color06 '#ffffff'
set -l color07 '#08bdba'
set -l color08 '#3ddbd9'
set -l color09 '#78a9ff'
set -l color0A '#ee5396'
set -l color0B '#33b1ff'
set -l color0C '#ff7eb6'
set -l color0D '#42be65'
set -l color0E '#be95ff'
set -l color0F '#82cfff'

function saveKittySession
   kitty @ ls | ~/.local/bin/kiss
   cp /tmp/kitty-sesison.kitty ~/.config/kitty/kitty-session.kitty
end

alias sks=saveKittySession  
clipse -listen
fzf_configure_bindings --variables=\e\[47\;9u
# set --export FZF_DEFAULT_OPTS '--cycle --height=40% --preview-window=wrap --marker="*" --pointer="⏺" --separator="─" --scrollbar="" --prompt="􀊫 " --color=prompt:#c4746e --color=marker:#c4746e --color=bg:#000000 --color=fg:#d0d0d0 --color=header:#8a9a7b --color=pointer:#c4746e --color=label:#aeaeae --color=bg+:#000000 --color=fg+:#c4746e --color=query:#c4746e --color=hl:#c4746e --color=hl+:#c4746e --color=border:#DCD7BA --layout=reverse'
# export FZF_DEFAULT_OPTS_FILE=/Users/gurgen/.config/fish/fesh.fzfrc
#
# set --export FZF_DEFAULT_OPTS '--cycle --height=40% --preview-window=wrap --marker="*" --pointer="⏺" --separator="─" --scrollbar="" --prompt="􀊫 " --color=prompt:$color0A --color=marker:#DE717C --color=bg:#121C2D --color=fg:#7DF9CA --color=header:#FF9900 --color=pointer:#DE717C --color=label:#7DF9CA --color=bg+:#121C2D --color=fg+:#7DF9CA --color=query:#DE717C --color=hl:#DE717C --color=hl+:#DE717C --color=border:#121C2D --layout=reverse'
#
#set --export FZF_DEFAULT_OPTS '--cycle --height=40% --preview-window=wrap --marker="*" --pointer="⏺" --separator="─" --scrollbar="" --prompt="􀊫 " --color=bg+:#262626 --color=bg:#161616 --color=spinner:#ff7eb6 --color=hl:#42be65 --color=fg:#dde1e6 --color=header:#42be65 --color=info:#ee5396 --color=pointer:#ff7eb6 --color=marker:#ff7eb6 --color=fg+:#fffff0 --color=prompt:#ee5396 --color=hl+:#42be65'

set --export FZF_DEFAULT_OPTS '--cycle --height=64% --preview-window=wrap --marker="􁉃 " --pointer="􁉃 " --separator="─" --scrollbar="" --prompt="􁉃  " --color=bg+:#0A0E14 --color=bg:#0A0E14 --color=spinner:#E78A4E --color=hl:#E78A4E --color=fg:#C1A78E --color=header:#50A1CE --color=info:#50A1CE --color=pointer:#E78A4E --color=marker:#50A1CE --color=fg+:#fffff0 --color=prompt:#E78A4E --color=hl+:#42be65'

export PATH="$PATH:$HOME/.local/bin"
#alias z=__zoxide_z
zoxide init fish | source
