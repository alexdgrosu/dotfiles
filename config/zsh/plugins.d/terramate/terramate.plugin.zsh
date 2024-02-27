function tm() {
    terramate fmt

    case "$1" in

    "-watch-fmt")
        echo "🤖 Watching .hcl files to run fmt..."
        watchexec -r -e 'hcl' 'terramate fmt'
        ;;
    "")
        terramate generate
        ;;
    *)
        terramate "$@"
        ;;
    esac
}

complete -o nospace -C /home/adg/.asdf/installs/terramate/0.4.3/bin/terramate terramate tm
