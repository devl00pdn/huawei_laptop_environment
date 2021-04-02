mkdir -p ~/tmp/apps_install/autojump && cd ~/tmp/apps_install/autojump
git clone https://github.com/wting/autojump.git
cd autojump
./uninstall.py
./install.py
mkdir -p ~/tmp/apps_install/oh_my_zsh && cd ~/tmp/apps_install/oh_my_zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh ./install

