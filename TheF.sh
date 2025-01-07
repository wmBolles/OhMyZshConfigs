# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    TheF.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/07 10:42:39 by wabolles          #+#    #+#              #
#    Updated: 2025/01/07 12:18:16 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/zsh

if [ ! -x ./settings/DarkMode.sh ]; then
  chmod +x ./settings/DarkMode.sh
fi

if [ ! -x ./settings/NightLight.sh ]; then
  chmod +x ./settings/NightLight.sh
fi

zshrc_path=$(cd ~ && echo "$PWD/.zshrc")

if [ ! -f "$zshrc_path" ]; then
  touch "$zshrc_path"
fi

aliases=$(cat <<'EOF'
date "+%T"
printf "\033[1;33m
  |    |  |               __ __| |           __|    |
 _|    __ |   -_)  |  |      |     \    -_)  _|    _|
 _)   _| _| \___| \_, |     _|  _| _| \___| _|     _)
                  ___/

\033[0m"
cd /home/wabolles/Desktop
bash ~/Desktop/zshc/settings/DarkMode.sh
bash ~/Desktop/zshc/settings/NightLight.sh
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


cat <<EOF > ~/set-resolution.sh
#!/bin/bash
current_resolution=\$(xrandr | grep "*" | awk '{print \$1}')
if [ "\$current_resolution" != "3200x1800" ]; then
  xrandr --output \$(xrandr | grep " connected" | cut -d" " -f1) --mode 3200x1800
fi
EOF
chmod +x ~/set-resolution.sh
echo "~/set-resolution.sh" >> ~/.profile



if ! grep -q "Custom Aliases and Functions" "$zshrc_path"; then
  echo "$aliases" >> "$zshrc_path"
fi

. "$zshrc_path"