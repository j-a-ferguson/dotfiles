
echo "=============================  Running .zshrc =============================="


set -o xtrace

# terminal appearance
export PROMPT='%B%F{magenta}%1~:%b  %f'
alias ls="ls -G"

# setup modules
if [[ "$(uname -m)" == "arm64" ]]; then
    HOMEBREW_HOME=/opt/homebrew
elif [[ "$(uname -m)" == "x86_64" ]]; then 
    HOMEBREW_HOME=/usr/local
fi
source $HOMEBREW_HOME/opt/modules/init/zsh
module use $HOME/projects/opt/modulefiles

# setup ssh 
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# setup ruby 
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

set +o xtrace
echo "============================= end of .zshrc =============================="