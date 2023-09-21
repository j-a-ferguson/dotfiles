
echo "=============================  Running .zshrc =============================="


set -o xtrace

# terminal appearance
export PROMPT='%B%F{magenta}%1~:%b  %f'
alias ls="ls -G"

# setup modules
source /opt/homebrew/opt/modules/init/zsh
module use $HOME/projects/opt/modulefiles

set +o xtrace
echo "============================= end of .zshrc =============================="