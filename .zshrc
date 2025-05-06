
# Activate `fnm`: https://github.com/Schniz/fnm
if command -v fnm >/dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

# Activate `direnv`: https://direnv.net/
if command -v direnv >/dev/null; then
    eval "$(direnv hook zsh)"
fi

autoload -Uz vcs_info
precmd() { vcs_info }

setopt prompt_subst
PROMPT='%d ${vcs_info_msg_0_} %# '

# Custom widgets for prefix-based history search
function history-search-backward() {
  zle .history-beginning-search-backward
}
function history-search-forward() {
  zle .history-beginning-search-forward
}

zle -N history-search-backward
zle -N history-search-forward

# Bind Up/Down arrows to prefix history search
bindkey "^[[A" history-search-backward  # Up arrow
bindkey "^[[B" history-search-forward   # Down arrow

# Disable bell
setopt NO_BEEP
