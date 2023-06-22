#!/bin/bash

# Printing our text in purple (technically blue but w/e)
function print {
  echo -e "\033[34m$1\033[0m"
}

function link {
  file="$1"
  if [ ! -e $HOME/$file -a ! -L $HOME/$file ]; then
    print "Creating link for $file..."
    ln -s $HOME/dotfiles/$file $HOME/$file
  else
    print "Appending Sara's config to $file..."
    cat $HOME/dotfiles/$file >> $HOME/$file
  fi
}

# Symlinks
link .vimrc
link .tmux.conf
print "Created symlinks"

# Installing vim Plug and plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
print "vim plugins installed"

# For MacOS, grab stuff for iTerm
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Installing Powerline fonts
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
  print "Set up Powerline fonts"
  if [ ! -e ~/Monokai%20Soda.itermcolors ]; then
    curl -fLo ~/Monokai%20Soda.itermcolors https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Monokai%20Soda.itermcolors
    print "Monokai Soda iterm template downloaded to home dir"
  fi
fi
print "All set up! Have fun storming the castle!"
