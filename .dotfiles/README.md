# dotfiles

## Setup
`alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"`

```sh
git init --bare $HOME/dotfiles
dotfiles config --local status.showUntrackedFiles no
```

## Add new dotfile
```sh
dotfiles add .vimrc
dotfiles commit -m "Add .vimrc"
dotfiles push
```

## References
- [https://news.ycombinator.com/item?id=11071754](https://news.ycombinator.com/item?id=11071754)
- [https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

