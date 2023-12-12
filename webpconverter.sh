#!/bin/bash

# Prompt the user to enter the path to the directory containing images
read -p "Enter the path to the directory containing images: " path

# Check if the entered path is valid
if [[ ! -d "$path" ]]; then
    echo "The specified path does not exist or is not a directory."
    exit 1
fi

# Loop through all PNG, JPG, and JPEG files in the directory and its subdirectories
find "$path" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -exec sh -c '
  for file; do
    # Get the directory of the current file
    dir_path=$(dirname "$file")
    # Get the file name without extension
    filename=$(basename -- "$file")
    filename="${filename%.*}"
    # Resize the image to 1200px width while maintaining aspect ratio and convert to WebP
    if convert "$file" -resize 1200x "$dir_path/$filename-resized.png"; then
      if cwebp -q 80 "$dir_path/$filename-resized.png" -o "$dir_path/$filename.webp"; then
        # Optionally, remove the temporary resized PNG file
        rm "$dir_path/$filename-resized.png"
      fi
    fi
  done
' sh {} +

echo "Conversion complete!"
