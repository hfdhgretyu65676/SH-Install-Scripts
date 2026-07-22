arch=$(uname -m)
if [ "$arch" = "aarch64" ]; then
    echo "Installing Arm64 PineconeMC..."
    wget -qO- https://raw.githubusercontent.com/hfdhgretyu65676/SH-Install-Scripts/refs/heads/main/PineconeMC-install-arm64.sh | bash
fi
if [ "$arch" = "x86_64" ]; then
    echo "Installing Amd64 PineconeMC..."
    wget -qO- https://raw.githubusercontent.com/hfdhgretyu65676/SH-Install-Scripts/refs/heads/main/PineconeMC-install-amd64.sh | bash
fi
