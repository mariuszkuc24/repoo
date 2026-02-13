#!/bin/bash

# Read content from 1.txt
content=$(cat 1.txt)

# Create files 500.txt through 505.txt
for i in {500..505}; do
    echo "$content" > "$i.txt"
    echo "Created $i.txt"
done

echo "All files created successfully!"