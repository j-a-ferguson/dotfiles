
echo "============================= Running .zprofile =============================="

set -o xtrace
# Homebrew setup

if [[ "$(uname -m)" == "arm64" ]]; then
    HOMEBREW_HOME=/opt/homebrew
elif [[ "(uname -m)" == "x86_64" ]]; then 
    HOMEBREW_HOME=/usr/local
fi

eval "$($HOMEBREW_HOME/bin/brew shellenv)"
if [[ ! -L /Library/Java/JavaVirtualMachines/openjdk.jdk ]]; then
    sudo ln -sfn $HOMEBREW_HOME/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
fi


# if [[ "$(uname -m)" == "arm64" ]]; then
#     eval "$(/opt/homebrew/bin/brew shellenv)"
#     if [[ ! -L /Library/Java/JavaVirtualMachines/openjdk.jdk ]]; then
#         sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
#     fi
# elif [[ "(uname -m)" == "x86_64" ]]; then 
#     eval "$(/usr/local/bin/brew shellenv)"
#     sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# fi

# echo "  Setting Vscode defaults"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                   

set +o xtrace

echo "============================= end of .zprofile =============================="