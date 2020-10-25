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

### Encrypt/Decrypt file with GPG

1) Create GPG key : `gpg --full-gen-key`
2) Create file : `echo secret > secret`
3) Encrypt file : `gpg -r mail -e secret`
4) Decrypt : `gpg -d secret.gpg`


### Generate SSH key
- `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

### Screenshot
- install `gnome-screenshot`
- set save directory to ~/Pictures : `gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Pictures/"`

### Python tips and tricks
- man like for modules and classes : `python3 -m pydoc docker.utils.build`


### Git resources
- [First Aid Git](http://firstaidgit.io)

#### PR test
- git clone 
- `git remote add andrewlanex git@github.com:andrewlanex/babi`
- `git fetch andrewlanex`
- checkout to expendtab

### Terminal background color
`#404552`
