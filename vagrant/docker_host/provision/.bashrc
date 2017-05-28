
if [ -f /etc/.bashrc ]; then
    . /etc/.bashrc
fi

alias nvimrun="cd ~/dotfiles/docker/neovim; docker-compose run --rm neovim"
alias nvimbuild="sh /vagrant/provision/nvim_build.sh"
