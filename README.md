SaraBee's dotfiles
=================
This repo keeps my vimrc and tmux.conf together for convenience, and contains setup instructions for this stuff
and also some other hints for making my terminal look exactly the way I want
because I'm picky and can never actually remember how I set it up in the
first place.

Yeah, I know tmux.conf doesn't *really* belong in here.

### Setup ###
If you've already got stuff in .vim, back it up. Then we're gonna download this stuff and then make some symlinks:
    git clone git://github.com/SaraBee/dotfiles.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/tmux.conf ~/.tmux.conf

To install the vim plugins, first [get and install
vim-plug](https://github.com/junegunn/vim-plug#installation), then open up vim
and `:PlugInstall`. If you add any new plugins, do `:source %` to reload
vimrc and then `:PlugInstall`.

You'll need to [install the Powerline
fonts](https://github.com/powerline/fonts#quick-installation) to make Airline look nice.

Since you're trying to replicate my dev setup, you're also going to want to
install [tmux](https://github.com/tmux/tmux/wiki).

### Make It Look Like Home ##
I use [iTerm2](https://iterm2.com/), with the color scheme [Monokai
Soda](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Monokai%20Soda.itermcolors) and 13pt Inconsolata font. You may need to play with the character spacing a little to get the Powerline glyphs to look good.

### Credit ###
One million years ago, when I was a new vim user, [DeMarko](https://github.com/DeMarko) bequeathed unto
me his vimrc. A lot of the clever stuff in here is from [his
verison](https://github.com/DeMarko/dotvim), and I am also grateful for his
help while I was cleaning it up to remove things I don't actually use!
