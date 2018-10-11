# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# The next line adds cargo to path
export PATH="$HOME/.cargo/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/lerche/.google/google-cloud-sdk/path.bash.inc' ]; then source '/home/lerche/.google/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/lerche/.google/google-cloud-sdk/completion.bash.inc' ]; then source '/home/lerche/.google/google-cloud-sdk/completion.bash.inc'; fi

# The next line enables shell command completion for kubectl.
source <(kubectl completion bash)

# Add swift toolchain
export PATH="/home/lerche/.local/dev/toolchains/swift/swift-DEVELOPMENT-SNAPSHOT-2018-08-26-a-ubuntu18.04/usr/bin:$PATH"

# asdf version manager (elixir, erlang, ruby, etc)
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# nix
if [ -e /home/lerche/.nix-profile/etc/profile.d/nix.sh ]; then . /home/lerche/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# istio
export PATH="/home/lerche/.local/dev/toolchains/istio/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
alias activate_pyenv_shim='eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"'

# alacritty bash completion
# source $HOME/.bash_completion/alacritty

# neovim config stuff
export NEOVIM_PYTHON3_PATH="$PYENV_ROOT/versions/neovim3"
export NEOVIM_PYTHON2_PATH="$PYENV_ROOT/versions/neovim2"
