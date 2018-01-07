
# bash
source ~/.bash_profile
source ~/.bashrc

# dotfiles
if [ -d ~/dotfiles ]; then
    cd ~/dotfiles
    git fetch origin
    git reset --hard origin/master
else
    git clone https://github.com/notomo/dotfiles.git
fi
sh ~/dotfiles/link.sh
cd ~

# composer
mkdir -p ~/.config/composer
cp -f /vagrant/provision/composer.json ~/.config/composer/composer.json
cd ~/.config/composer
composer global install

# phpmanual
cd ~/.vim/reference
wget -nv http://jp2.php.net/get/php_manual_ja.tar.gz/from/this/mirror -O php_manual_ja.tar.gz
tar zxf php_manual_ja.tar.gz
mv php-chunked-xhtml phpmanual
rm php_manual_ja.tar.gz

# go
go get -u github.com/nsf/gocode
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/golang/lint/golint
go get -u github.com/go-task/task/cmd/task

# ruby
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo yum install -y gcc-6 bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel
source ~/.bashrc
rbenv install 2.4.2
rbenv global 2.4.2
gem install neovim
gem install rubocop

# neovim-remote
pip3.5 install --user neovim-remote
git config --global core.editor 'nvr --remote-wait-silent'

# cd ~/app
# wget -nv https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip
# unzip protoc-3.5.1-linux-x86_64.zip -d ~/app/protoc
# cp ~/app/protoc/bin/protoc ~/.local/bin/protoc

# groovy
cd ~/app
mkdir -p groovy
cd groovy
wget -nv --no-check-certificate https://dl.bintray.com/groovy/maven/groovy-binary-2.4.3.zip
unzip groovy-binary-2.4.3.zip
rm groovy-binary-2.4.3.zip
ln -s groovy-2.4.3 ./latest

# rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup default nightly
rustup component add rls-preview --toolchain nightly
rustup component add rust-analysis --toolchain nightly
rustup component add rust-src --toolchain nightly
rustup run nightly cargo install rustfmt-nightly --force

# workspace
mkdir -p ~/workspace
cd ~/workspace
mkdir -p test
mkdir -p memo
mkdir -p readonly

chmod 705 ~
