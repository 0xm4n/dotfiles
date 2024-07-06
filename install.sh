#!/bin/bash

if [ ! -d "$HOME/.config" ]; then
    echo "Make $HOME/.config"
    mkdir "$HOME/.config"
fi

################################
echo -e "Checking Start...\n"

# Git
echo -e "Checking Git install...\n"
hash git 2>/dev/null || { echo >&2 "Require Git is not installed! Please install Git first"; exit 1; }
git --version
echo -e "Checking Git Completed!\n"

# zsh
echo -e "Checking zsh install...\n"
hash zsh 2>/dev/null || { echo >&2 "Require zsh is not installed! Please install zsh first"; exit 1; }
zsh --version
echo -e "Checking zsh Completed!\n"

# vim
echo -e "Checking vim install...\n"
hash vim 2>/dev/null || { echo >&2 "Require vim is not installed! Please install vim first"; exit 1; }
echo -e "Checking vim Completed!\n"

# nvim
# echo "Checking neovim install...\n"
# hash nvim 2>/dev/null || { echo >&2 "Require neovim is not installed! Please install neovim first"; exit 1; }
# neovim --version
# echo "Checking neovim Completed!\n"

# tmux
echo -e "Checking tmux install...\n"
hash tmux 2>/dev/null || { echo >&2 "Require tmux is not installed! Please install tmux first"; exit 1; }
echo -e "Checking tmux Completed!\n"

echo -e "Checking Completed!\n"

# vimrc
if [ -e "$HOME/.vimrc" ]; then
    echo "Backing up ~/.vimrc to ~/.vimrc_backup"
    mv "$HOME/.vimrc" "$HOME/.vimrc_backup"
fi
cp .vimrc "$HOME/.vimrc"

# zsh
if [ -e "$HOME/.zshrc" ]; then
    echo "Backing up ~/.zshrc to ~/.zshrc_backup"
    mv "$HOME/.zshrc" "$HOME/.zshrc_backup"
fi
cp .zshrc "$HOME/"
if [ ! -d "$HOME/.config/zsh/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
fi
if [ ! -d "$HOME/.config/zsh/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
fi
if [ -d "$HOME/.config/zsh" ]; then
    mv "$HOME/.config/zsh" "$HOME/.config/zsh_backup"
fi
cp -rf ./.config/zsh "$HOME/.config/"

# tmux
if [ -e "$HOME/.tmux.conf" ]; then
    echo "Backing up ~/.tmux.conf to ~/.tmux_backup"
    mv "$HOME/.tmux.conf" "$HOME/.tmux_backup"
fi
cp .tmux.conf "$HOME/"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
bash "$HOME/.tmux/plugins/tpm/bin/install_plugins"

echo "making zsh default shell..."
chsh -s "$(which zsh)"

exec zsh
