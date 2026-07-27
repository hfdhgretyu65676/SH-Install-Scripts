echo "Writing code to $HOME/cat-bash.sh"
cat << 'EOF' > $HOME/cat-bash.sh
user=$(whoami)
echo "Welcome to cat bash, to get started, run 'help'"

while true; do
    read -r -p "$user@cat:~$ " command

    case "$command" in
        "help")
            echo 'Welcome to cat-bash. Commands:'
            echo '  give catnip - gives catnip to kitty'
            echo '  pet         - pets the kitty'
            echo '  exit        - Exits Cat-Bash'
            echo "  meow        - Spams 'meow'"
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
            while true; do
            echo 'meow'
            sleep 0.1
        done
            ;;
        *)
            echo "cat-bash: command not found: $command"
            ;;
    esac
done
EOF
chmod +x $HOME/cat-bash.sh
echo "Done! File is at $HOME/cat-bash.sh"
