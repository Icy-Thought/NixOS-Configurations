# General Configurations
set fish_greeting
set -gx EDITOR nvim
set -g fish_key_bindings fish_vi_keybindings

# Customizable fish_title
function fish_title
    echo -ne $hostname 'Terminal'
end

# Start TMUX on Terminal Start
# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end

# Defining Paths
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.emacs.d/bin $PATH
set PATH $HOME/go/bin $PATH

# Sources
starship init fish | source
