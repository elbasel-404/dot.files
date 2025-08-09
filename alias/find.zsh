find.file() {
    echo "$1"
    find . -name "$1"
}

find.directory() {
    find . -type d -name "$1"
}

