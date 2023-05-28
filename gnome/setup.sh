#!/bin/sh

echo "Enabling fractional scaling"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
echo "Fractional scaling enabled. Relog for change to take effect"

