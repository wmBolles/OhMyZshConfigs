# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    NightLight.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/07 11:34:46 by wabolles          #+#    #+#              #
#    Updated: 2025/01/07 11:36:40 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ "$(gsettings get org.gnome.settings-daemon.plugins.color night-light-enabled)" = "false" ]; then
  gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
fi
