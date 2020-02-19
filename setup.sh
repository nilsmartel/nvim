function install_prog() {
  prog=$1
  if [ -n $(which pacman) ]; then
      sudo pacman -S $prog
  fi

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
  name=$2
  echo "Checking $name"
  if [ -n $(which $prog) ]; then
    echo "$name exists"
  else
    echo "Installing $name"
    install_prog $name
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

check_programm nvim neovim
check_programm curl curl
install_plug
link_neovim
nvim --headless +PlugInstall +q
