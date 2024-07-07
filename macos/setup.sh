#!/usr/bin/env bash

# Install the apple developer tools
xcode-select --install

# Link the .zprofile
cwd=$(pwd)
cd $HOME
ln -s "$cwd/.zprofile" .zprofile
ln -s "$cwd/.zshrc" .zshrc
cd $cwd

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "(uname -m)" == "x86_64"]]; then 
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Create a projects folder and scaffold for later installations
mkdir -p $HOME/projects/opt
cp -rf $cwd/modulefiles $HOME/projects/opt/

# Install Apps
brew install --cask dropbox
brew install --cask visual-studio-code
brew install --cask obsidian    
brew install --cask pdf-expert
brew install --cask docker
brew install --cast 1password
brew install --cask 1password-cli
brew install gh # the github cli
brew install --cask affinity-designer
brew install --cask affinity-publisher
if [[ "$(uname -m)" == "arm64" ]]; then
    brew install --cask chatgpt
fi

# setup ssh 
mkdir ~/.ssh
cp ssh/config ~/.ssh


# Install C++ development tools
brew install llvm
brew install cmake
brew install ninja
brew install doxygen
brew install modules

# install vcpkg
cd $HOME/projects/opt
git clone https://github.com/Microsoft/vcpkg.git
./vcpkg/bootstrap-vcpkg.sh

#install Java 
brew install openjdk

# Install python
brew install python

# install ruby (for Jekyll) 
brew install chruby ruby-install zx
ruby-install ruby 3.1.3

# Install javascript/typescript for vs code devleopment
brew install node
npm install -g yo generator-code

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh