sudo apt install wget tar -y
wget https://github.com/AndreRH/hangover/releases/download/hangover-11.9/hangover_11.9_debian12_bookworm_arm64.tar
mkdir Hangover
mv hangover_11.9_debian12_bookworm_arm64.tar Hangover
cd Hangover
tar -xf hangover_11.9_debian12_bookworm_arm64.tar
rm hangover_11.9_debian12_bookworm_arm64.tar
sudo apt install ./hangover*.deb -y
echo "Done! Installed Hangover"
cd ~
rm -rf ~/Hangover
