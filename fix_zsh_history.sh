#!/bin/bash
# script to fix .zsh_history when it breaks
# https://superuser.com/a/957924
mv ~/.zsh_history .zsh_history_bad
strings .zsh_history_bad > ~/.zsh_history
fc -R ~/.zsh_history
rm .zsh_history_bad
