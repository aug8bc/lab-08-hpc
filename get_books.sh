#!/bin/bash
set -euo pipefail
mkdir -p "$2"
aws s3 cp "s3://$1" "$2" --recursive --exclude "*" --include "*.txt"
echo "File path" > book_list.txt
book_dir=$(realpath "$2")
find "$book_dir" -name "*.txt" | sort >> book_list.txt
tail -n +2 book_list.txt | wc -l
