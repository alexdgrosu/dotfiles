function tm() {
    case "$1" in

    "-run-pre-commit")
        echo "Running pre-commit in current subtree"
        terramate run -- sh -c 'git ls-files | xargs pre-commit run --files'
        ;;
    "")
        terramate generate
        ;;
    *)
        terramate "$@"
        ;;
    esac
}

complete -o nospace -C terramate terramate tm
