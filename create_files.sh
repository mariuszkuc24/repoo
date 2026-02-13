#!/bin/bash

# Script to create files 576.txt through 580.txt with content from 500.txt

SOURCE_FILE="500.txt"

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file $SOURCE_FILE not found!"
    exit 1
fi

# Create files 576.txt through 580.txt
for i in {576..580}; do
    FILENAME="${i}.txt"
    
    # Copy content from source file
    cp "$SOURCE_FILE" "$FILENAME"
    
    # Verify the file was created
    if [ -f "$FILENAME" ]; then
        echo "Created: $FILENAME"
    else
        echo "Error: Failed to create $FILENAME"
        exit 1
    fi
done

echo "All files created successfully!"
exit 0
