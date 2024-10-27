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

# (scripts in ~/bin)
# mounting drives
source mnt_drives

# adding additional paths to PATH
source topath

# setting additional environment variables
source envars

# setting pop workspace shortcuts
source pop_workspace_shortcuts
. "$HOME/.cargo/env"
#
# >>> coursier install directory >>>
export PATH="$PATH:/home/rahi/.local/share/coursier/bin"
# <<< coursier install directory <<<

[ -f "/home/rahi/.ghcup/env" ] && . "/home/rahi/.ghcup/env" # ghcup-env
