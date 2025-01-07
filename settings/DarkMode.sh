# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    DarkMode.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/07 10:42:37 by wabolles          #+#    #+#              #
#    Updated: 2025/01/07 10:57:56 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || [ "$XDG_CURRENT_DESKTOP" = "Unity" ]; then
  GTK_SETTINGS=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")
  
  if [[ "$GTK_SETTINGS" != *"dark"* ]]; then
    gsettings set org.gnome.desktop.interface gtk-theme "Ambiance"
    echo "Dark mode has been enabled..."
  else
    gsettings set org.gnome.desktop.interface gtk-theme "Radiance"
    echo "Dark mode has been disabled..."
  fi
else
  echo "Dark mode toggle is only supported on GNOME or Unity."
fi


gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"