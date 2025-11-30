# -----------------------------------------------------
# CUSTOMIZATION
# -----------------------------------------------------
# This is my own personal modifications
# Michael McGrath
# 18-October-2025
# -----------------------------------------------------
# Prompt
# -----------------------------------------------------
# eval "$($HOME/.local/bin/oh-my-posh init fish --config $HOME/.config/ohmyposh/gruvbox.omp.json)"
eval "$($HOME/.local/bin/oh-my-posh init fish --config $HOME/.config/ohmyposh/dracula-python.omp.json)"

# Add doom emacs to PATH
set PATH "$HOME/.config/emacs/bin/:$PATH"

# Aliases
alias upd="ml4w-update"
alias gb='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
