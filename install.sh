# Install Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
# Add brew to path:
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# This is not pretty... should probably be refactored...
# Awesome config
if [ -e $HOME/.config/awesome ]; then
    echo "Awesome config found at $HOME/.config/awesome. Skipping..."
else
    ln -s $(pwd)/awesome $HOME/.config/awesome
fi

# Ranger config
if [ -e $HOME/.config/ranger ]; then
    echo "Ranger config found at $HOME/.config/ranger. Skipping..."
else
    ln -s $(pwd)/ranger $HOME/.config/ranger
fi

# neovim config
if [ -e $HOME/.config/nvim/init.vim ]; then
    echo "neovim config found. Skipping..."
else
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p $HOME/.config/nvim/ 2> /dev/null
    ln -s $(pwd)/init.vim $HOME/.config/nvim/init.vim
fi

# X stuff
if [ -e $HOME/.xinitrc ]; then
    echo "Config found at $HOME/.xinitrc. Skipping..."
else
    ln -s $(pwd)/.xinitrc $HOME/.xinitrc
fi

if [ -e $HOME/.Xresources ]; then
    echo "Config found at $HOME/.Xresources Skipping..."
else
    ln -s $(pwd)/.Xresources $HOME/.Xresources
fi

if [ -e $HOME/.zshrc ]; then
    echo "Config found at $HOME/.zshrc Skipping..."
else
    mkdir ~/.antigen 
    curl -L git.io/antigen > ~/.antigen/antigen.zsh
    ln -s $(pwd)/.zshrc $HOME/.zshrc
fi

if [ -e $HOME/.nvm ]; then
    echo "Installing nvm (for nodejs support)"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
fi


brew install diff-so-fancy

# Git stuff
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global push.default "current"
git config --global alias.co "checkout"
git config --global alias.ci "commit"
git config --global alias.st "status"
