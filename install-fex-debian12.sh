arch=$(arch)

id=$(cat /etc/os-release | grep "^ID=" | cut -d'=' -f2 | tr -d '"')
version=$(cat /etc/os-release | grep "^VERSION_ID=" | cut -d'=' -f2 | tr -d '"')

if [ "${id}-${version}" = "debian-12" ]; then
    if [ "$arch" = "x86_64" ]; then
         echo "Error! You are on x86_64, you need Arm64 for this to work. Exiting..."
         exit 1
    elif [ "$arch" = "i386" ]; then
       echo "Error! you are on a 32-bit system, you need a 64-bit version of arm64. exiting..."
       exit 1
    else  
        echo "Downloading .tar.gz file from Github repo..."
        sudo wget --silent -O /tmp/FEX-Emu-Debian12-ARM64.tar.gz https://github.com/hfdhgretyu65676/Debian12-FEX-Pre-compiled/releases/download/Debian12/FEX-Emu-Debian12-ARM64.tar.gz
        
        if [ $? = "0" ]; then
            echo "Done. Extracing..."
        else
            echo "Command failed! check if you have Wget installed or have a solid connection."
            exit 1
        fi
        
        sudo tar -xzvf /tmp/FEX-Emu-Debian12-ARM64.tar.gz -C /
        if [ $? = "0" ]; then
            echo "Installed FEX successfully, Enjoy!"
        else
            echo 'Command failed! Do you have "tar" installed yet?'
            exit 1
        fi
    fi # Closes the arch if statement
else
 
    echo "Error! Detected system is '${id}-${version}'. This script is strictly for debian-12 systems. Exiting..."
    exit 1
fi
