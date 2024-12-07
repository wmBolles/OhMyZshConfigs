#!/bin/zsh

sh ./DarkMode.sh

ZSHRC_PATH=$(cd ~ && echo "$PWD/.zshrc")

if [ ! -f "$ZSHRC_PATH" ]; then
  touch "$ZSHRC_PATH"
fi

ALIASES_CONTENT=$(cat <<'EOF'
date "+%T"
printf "\033[1;33m
  |    |  |               __ __| |           __|    |
 _|    __ |   -_)  |  |      |     \    -_)  _|    _|
 _)   _| _| \___| \_, |     _|  _| _| \___| _|     _)
                  ___/

\033[0m"

cd /Users/wabolles/Desktop/

alias c=clear
alias m=make
alias mc="make clean"
alias mf="make fclean"
alias mr="make re"
alias n="norminette"
alias v='open -a "Visual Studio Code"'
alias add="git add ."
alias gc='git commit -m "No Need To Set Commit !"'
alias sl=ls
alias code=v
echo -e "\033[1;33mAll aliases have been successfully created...\033[0m"

setcommituser() {
    git config --global user.name "TheF" &&
    git config --global user.email "wassimbolles18@gmail.com" &&
    git config user.name "TheF" &&
    git config user.email "wassimbolles18@gmail.com" &&
    echo "Git global and local user name and email have been set!"
}

alias cclean='bash ~/Cleaner_42.sh'
EOF
)

if ! grep -q "Custom Aliases and Functions" "$ZSHRC_PATH"; then
  echo "$ALIASES_CONTENT" >> "$ZSHRC_PATH"
fi

source "$ZSHRC_PATH"

