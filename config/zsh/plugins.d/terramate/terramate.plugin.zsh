function tm() {
    case "$1" in

    "-run-pre-commit")
        echo "Running pre-commit in current subtree"
        terramate run -- sh -c 'git ls-files | xargs pre-commit run --files'
        ;;

    "-watch-fmt")
        echo "Watching .hcl files to run fmt..."
        watchexec -r -e 'hcl' 'terramate fmt'
        ;;

    "-watch-generate")
        echo "Watching .hcl files to run generate..."
        watchexec -r -e 'hcl' 'terramate fmt && terramate generate'
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
