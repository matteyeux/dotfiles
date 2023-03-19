# dotfiles

### Package installation

For default installation : `cat packages/default.list | xargs sudo apt install -y`

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
- `ssh-keygen -t ed25519 -C "your_email@example.com"`

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

### i3 config
Current wallpaper : [here](https://cdn.statically.io/img/www.pixelstalk.net/wp-content/uploads/2016/04/Backgrounds-dark-minimalist-wallpapers.jpg)

### Setup current DE

Run : `sudo apt install fonts-font-awesome numlockx thunar compton rofi feh i3 polybar policykit-desktop-privileges policykit-1-gnome`

You can install a different theme, such as the parrot one (available as a deb file in this repo), mais sure to install `lxappearance`.

### Brightness
Install `light` and run `sudo light -A 10` to increase brightness.


### Use IDA with Rofi

`cp ~/Desktop/IDA\ Freeware\ 7.6.desktop ~/.local/share/applications/`


### Notes about thinkfan for my Thinkpad T14 Gen 3

Use [zcfan](https://github.com/cdown/zcfan)



### Special thanks
- [alexmjd](https://github.com/alexmjd)
