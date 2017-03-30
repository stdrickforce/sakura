if [ "${BASH-no}" != "no" ]; then
    [ -r ~/.bashrc ] && . ~/.bashrc
fi

# git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# nvm
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# composer path
export PATH=~/.composer/vendor/bin:$PATH

# go path
export GOROOT=/usr/local/go
export GOPATH=/Users/stdrickforce/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

echo ""
echo -e "\033[32m  ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤\033[0m \033[36mE! E! E!"
echo -e "\033[32m  ├ ++++++ \033[35mエミリアたん\033[0mまじ\033[33m天使\033[0m!\033[32m ++++++ ┤ \033[36mM! M! M!"
echo -e "\033[32m  ├┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┤\033[0m \033[36mT! T! T!"
echo -e "\033[32m  ├ +++++ \033[31m祈ちゃん\033[0mの\033[34mなぞなぞ\033[33mタイ~\033[32m +++++ ┤ \033[34mMisasagi"
echo -e "\033[32m  ├┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┤\033[0m \033[34mInori~\033[0m"
