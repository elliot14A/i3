# Set default environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERM xterm-256color

# Add custom paths
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.pulumi/bin

# Initialize starship
if type -q starship
    starship init fish | source
end

# Configure FZF keybindings
if type -q fzf
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
end

# Disable greeting
set -g fish_greeting ""

# Aliases
# System
alias l="eza -la"
alias ll="eza -l"
alias ls="eza"
alias cat="bat"
alias ..="cd .."
alias ...="cd ../.."
alias kiwi-kube="kubectl --kubeconfig=$HOME/.pulumi/k3s/config"
alias kiwi-k9s="KUBECONFIG=$HOME/.pulumi/k3s/config k9s"

# Editor
alias v="nvim"
alias vim="nvim"

# Zellij
alias z="zellij"
alias za="z attach"
alias znew="z -s"

# GCloud
alias gprod="gcloud container clusters get-credentials prod-factly --zone asia-south1-a --project factly-prod"
alias gstag="gcloud container clusters get-credentials stag-factly --zone asia-south1-a --project factly-prod"
alias gtagore="gcloud container clusters get-credentials factly-tagore-mumbai --region asia-south1 --project factly-tagore"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/elliot14A/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/home/elliot14A/Downloads/google-cloud-sdk/path.fish.inc'; end

