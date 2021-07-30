#!/bin/bash

sudo apt -y install tmux git

rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy config files
cp $SETUP_HOME/templates/tmux.config $HOME/.tmux.conf

# Start TMUX by default
bash_content="
# TMUX as default terminal
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	tmux attach -t default || tmux new -s default
fi
"
# Prints bash_content to BASHRC file
printf '%s' "$bash_content" >> $BASHRC

source ~/.tmux.conf
tmux source ~/.tmux.conf

