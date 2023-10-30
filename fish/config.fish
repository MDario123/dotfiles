if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vim nvim
    alias please sudo
    set -g fish_greeting
    set EDITOR vim
end

export $(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

zoxide init fish | source

