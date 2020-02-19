function install_prog() {
  if [ -n $(which apk) ]; then
    apk add $prog
  fi

  if [ -n $(which apt) ]; then

    sudo apt install -y $prog
  fi

  if [ -n $(which brew) ]; then
    brew install $prog
  fi
}

function check_programm() {
  prog=$1
  echo "Checking $prog"
  if [ -n $(which $prog) ]; then
    echo "$prog exists"
  else
    echo "Installing $prog"
    install_prog $prog
  fi
}

function install_plug() {
  echo 'Installing vim-plug'
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function link_neovim() {
  echo 'linking nvim to vim? [y|n]'
  read confirm

  if [[ $confirm = 'y' ]]; then
    ln $(which nvim) /usr/local/bin/vim
  fi
}

check_programm nvim
check_programm curl
install_plug
link_neovim
nvim --headless +PlugInstall +q
