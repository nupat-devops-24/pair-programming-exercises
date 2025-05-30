#!/bin/bash

# Define the path where nupat file is located

SOURCE_DIR="$HOME/Documents/nupat"
DEST_DIR="$HOME/Downloads"

# Create a zip file

zip -rq nupat.zip $SOURCE_DIR

mv nupat.zip $DEST_DIR