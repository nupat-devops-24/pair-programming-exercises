#!/bin/bash


TARGET_DIR="/home/adams/Downloads"

# Check if the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Target directory does not exist: $TARGET_DIR"
  exit 1
fi

function list_all_txt_files() {
  echo -e "Number of txt files in the Downloads directory"
  find $TARGET_DIR -name "*.txt" | wc -l
}

list_all_txt_files

function txt_files_older_than_7_days() {
  echo -e "\nNumber of txt files older than 7 days"
  find $TARGET_DIR -name "*.txt" -mtime +7 | wc -l
}

txt_files_older_than_7_days

function single_file_size_in_bytes() {
  echo -e "\nFile size of a single sample txt file in MB"
  file_size=$(stat -c %s "$TARGET_DIR/timezone-edit.txt")
  file_size_MB=$(echo "scale=6; $file_size / 1000000" | bc)
  echo $file_size_MB
}

single_file_size_in_bytes

function combined_file_size_in_bytes() {
  echo -e "\nCombined size of target files in MB"
  total_size=$(find $TARGET_DIR -name "*.txt" -mtime +7 -exec stat -c %s {} + | awk '{total += $1} END {print total}')
  total_size_MB=$(echo "scale=2; $total_size / 1000000" | bc)
  echo $total_size_MB
  # file_size=$(stat -c %s "/home/adams/Downloads")
  # # file_size_MB=($file_size / 1000000)
  # echo $file_size_MB
}

combined_file_size_in_bytes
