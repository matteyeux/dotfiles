# dotfiles

### Package installation

For default installation : `cat default.list | xargs apt install -y`
For dev installation : `cat default.list | xargs apt install -y`

### tmux cheat sheet
- `tmux new -s session_name` : new named session
- `tmux attach -t session_name` : attach an exsiting session
- `tmux switch -t session_name` : switch to an existing session
- `tmux list-sessions` : list sessions
- `(PREFIX + d)` : detach session
- `tmux kill-session -t session_name` : destroy session

To copy out of tmux : use `shift` key

### tmux copy mode

*This only works with my tmux.conf*

- `CTRL-w + m`
- navigate to beginning of text
- hit `space` then 
- once done : `enter`
- `CTRL-w + p`

