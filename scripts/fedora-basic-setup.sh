sudo dnf upgrade -y

(flatpak update --noninteractive && \
  flatpak install com.mattjakeman.ExtensionManager --noninteractive) &

(sudo dnf install -y git gh vim htop neofetch ffmpeg && \
  sudo dnf install -y gparted vlc mpv && \
  sudo dnf install -y papirus-icon-theme) &

sh <(curl -L https://nixos.org/nix/install) --no-daemon
# ? Or alternatively, the following.
# ? It is for multi-user installation with no SELinux.
# sh <(curl -L https://nixos.org/nix/install) --daemon
