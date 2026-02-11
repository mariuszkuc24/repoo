#!/bin/bash

# Script to create files 31-40.txt with identical content

# Content to put in each file
CONTENT="This is file number 31 through 40. All files have the same content."

# Create files 31.txt through 40.txt
for i in {31..40}; do
    echo "$CONTENT" > "${i}.txt"
    echo "Created ${i}.txt"
done

echo "All files created successfully!"