#!/bin/bash

# Script to create files 20.txt through 30.txt with identical content

# Define the content to put in each file
CONTENT="This is the content for files 20 through 30. All files have identical content."

# Create files from 20 to 30 inclusive
for i in {20..30}; do
    echo "$CONTENT" > "$i.txt"
    echo "Created file: $i.txt"
done

echo "All files created successfully!"
