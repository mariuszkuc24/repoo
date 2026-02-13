#!/bin/bash

# Script to create files 511-516.txt with content from 500.txt

# Check if source file exists
if [ ! -f "500.txt" ]; then
    echo "Error: Source file 500.txt not found!"
    exit 1
fi

# Read content from 500.txt
content=$(cat 500.txt)

# Create files 511.txt through 516.txt
for i in {511..516}; do
    filename="${i}.txt"
    echo "$content" > "$filename"
    echo "Created file: $filename"
    
    # Verify the file was created
    if [ -f "$filename" ]; then
        echo "  ✓ File created successfully"
    else
        echo "  ✗ Failed to create file: $filename"
    fi

done

echo "\nAll files created successfully!"
echo "Files created: 511.txt, 512.txt, 513.txt, 514.txt, 515.txt, 516.txt"
