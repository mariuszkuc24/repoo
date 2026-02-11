#!/bin/bash

# Script to create files 206-210 with content '1'

for i in {206..210}; do
    echo "1" > "$i"
    echo "Created file $i with content '1'"
done

echo "All files created successfully!"