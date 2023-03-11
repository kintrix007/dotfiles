sudo dnf upgrade -y

(flatpak update --noninteractive && \
flatpak install com.mattjakeman.ExtensionManager --noninteractive) &

sudo dnf install git gh vim htop neofetch papirus-icon-theme &
