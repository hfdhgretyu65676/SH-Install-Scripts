wget -O "$HOME/PineconeMC.AppImage" "https://github.com/ElyPrismLauncher/Launcher/releases/download/11.0.3/PineconeMC-Linux-x86_64.AppImage"
mkdir -p "$HOME/.local/share/icons"
wget -O "$HOME/.local/share/icons/PineconeMC.svg" "https://elyprismlauncher.github.io/assets/svg/icon.svg"
chmod +x "$HOME/PineconeMC.AppImage"
echo "Done! File Name is '$HOME/PineconeMC.AppImage'"
mkdir -p "$HOME/.local/share/applications"
echo "Creating $HOME/.local/share/applications/PineconeMC.desktop..."
cat << EOF > "$HOME/.local/share/applications/PineconeMC.desktop"
[Desktop Entry]
Type=Application
Name=PineconeMC
Comment=Launch PineconeMC Launcher
Exec=$HOME/PineconeMC.AppImage
Icon=$HOME/.local/share/icons/PineconeMC.svg
Terminal=false
Categories=Game;
EOF
echo "Created $HOME/.local/share/applications/PineconeMC.desktop! You can run $HOME/PineconeMC.AppImage to start PineconeMC, or find it in your system menu."
