#!/bin/sh

#install
apt install software-properties-common
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt install neovim ctag pip3 curl silversearcher-ag clang build-essential\
    cmake python3-dev zlib1g-dev ncurses-dev bear
pip3 install neovim

#setting nvim as default
update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
update-alternatives --config vi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
update-alternatives --config vim

#create setting file
mkdir -p .config/nvim
touch .config/nvim/init.vim

#pluging management
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#integrate with git
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
git config --global mergetool.fugitive.cmd 'vim -f -c "Gdiff" "$MERGED"'
git config --global merge.tool fugitive

#for ycm
cd /root/.config/nvim/autoload/YouCompleteMe && python3 install.py --clang-completer

#for cquery
#cd /root/.config/nvim/
#git clone --recursive https://github.com/cquery-project/cquery.git
#cd cquery
#mkdir build && cd build
#cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
#cmake --build .
#cmake --build . --target install
