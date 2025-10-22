#!/bin/bash

function show_usage {
    echo "Usage: $0 source_dir dest_dir"
    exit 1
}

function show_directory_inexist {
    echo "Directory '$1' doesn't exist. Creating it..."
    mkdir -p "$1" || {
        echo "Failed to create directory '$1'"
        exit 1
    }
}

# Main program starts here
if [ $# -ne 2 ]; then
    show_usage
fi

if [ -d "$1" ]; then
    source_dir="$1"
else
    echo "Invalid source directory: '$1'"
    show_usage
fi

if [ -d "$2" ]; then
    dest_dir="$2"
else
    show_directory_inexist "$2"
    dest_dir="$2"
fi

printf "Source directory is: %s\n" "$source_dir"
printf "Destination directory is: %s\n" "$dest_dir"
