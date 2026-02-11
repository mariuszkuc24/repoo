#!/bin/bash

# Script to create files from 320.txt to 350.txt with the same content

# Define the content to be written to each file
CONTENT="This is the same content for all files from 320 to 350."

# Loop from 320 to 350 inclusive
for i in {320..350}; do
    filename="${i}.txt"
    
    # Check if file already exists
    if [ -f "$filename" ]; then
        echo "File $filename already exists. Overwriting..."
    else
        echo "Creating $filename..."
    fi
    
    # Write content to file
    echo "$CONTENT" > "$filename"
    
    # Verify file was created
    if [ -f "$filename" ]; then
        echo "  ✓ $filename created successfully"
    else
        echo "  ✗ Failed to create $filename"
    fi
done

echo "\nAll files from 320.txt to 350.txt have been created with the same content."
echo "Total files created: $(ls -1 *.txt 2>/dev/null | wc -l)"