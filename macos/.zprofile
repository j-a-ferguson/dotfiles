
echo "============================= Running .zprofile =============================="

set -o xtrace
# Homebrew setup
eval "$(/opt/homebrew/bin/brew shellenv)"

# echo "  Setting Vscode defaults"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                   

set +o xtrace

echo "============================= end of .zprofile =============================="