#!/bin/sh

gnome_schema="org.gnome.desktop.interface"

# color-scheme: makes GTK4/libadwaita apps and Qt6 apps use dark mode
gsettings set "$gnome_schema" color-scheme "prefer-dark"

# gtk-theme: dark theme for GTK3 apps (Adwaita-dark is built into GTK3)
gsettings set "$gnome_schema" gtk-theme "Adwaita-dark"

gsettings set "$gnome_schema" icon-theme "kora"
gsettings set "$gnome_schema" cursor-theme "Bibata-Modern-Classic"
gsettings set "$gnome_schema" cursor-size 24
gsettings set "$gnome_schema" font-name "Cantarell 11"
