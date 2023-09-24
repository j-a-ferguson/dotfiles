
echo "=============================  Running .zshrc =============================="


set -o xtrace

# terminal appearance
export PROMPT='%B%F{magenta}%1~:%b  %f'
alias ls="ls -G"

# setup modules
source /opt/homebrew/opt/modules/init/zsh
module use $HOME/projects/opt/modulefiles

# setup ssh 
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

set +o xtrace
echo "============================= end of .zshrc =============================="