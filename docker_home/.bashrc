# GOPATH
export GOPATH=$HOME/ref:$HOME/dev
export PATH=$PATH:$GOPATH/bin

# Alias
alias g='cd $(ghq list -p | peco)'
