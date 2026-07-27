echo "Writing code to $HOME/cat-bash.sh"
cat << 'EOF' > $HOME/cat-bash.sh
#!/usr/bin/env bash

user=$(whoami)
echo "Welcome to cat bash! To get started, type 'help'."

while true; do
    read -r -p "$user@cat:~$ " command

    case "$command" in
        "help")
            echo 'Welcome to cat-bash. Commands:'
            echo '  give catnip - gives catnip to kitty'
            echo '  pet         - pets the kitty'
            echo '  meow        - Spams meows (Press Ctrl+C to stop)'
            echo '  ls          - Lists your files'
            echo '  ./FILE_NAME - Runs an executable file'
            echo '  exit        - Exits Cat-Bash'
            ;;
        "give catnip")
            echo '[CAT-BASH] Taking catnip...'
            sleep 1
            echo '[CAT-BASH] Eating catnip... *happy purrs*'
            sleep 1
            echo '[CAT-BASH] Exiting...'
            exit 0
            ;;
        "pet")
            echo '[CAT-BASH] *purrrrrr*'
            ;;
        "exit")
            echo 'Goodbye!'
            exit 0
            ;;
        "meow")
            echo "Press Ctrl+C to stop meowing..."
            while true; do
                echo 'meow'
                sleep 0.1
            done
            ;;
        "ls")
            ls
            ;;
        "")
            ;;
        ./*)
          
            if [ -x "$command" ]; then
                "$command"
            else
                echo "cat-bash: file not found or not executable: $command"
            fi
            ;;
        *)
            echo "cat-bash: command not found: $command"
            ;;
    esac
done
EOF

chmod +x $HOME/cat-bash.sh
echo "Done! File is at $HOME/cat-bash.sh"
