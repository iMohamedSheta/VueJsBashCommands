#!/bin/bash

# Log file path
log_file="commands/shell/log/make.log"


#Colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'


# Function to rollback file creation
rollback_file_creation() {
    local file_path=$1

   # Check if the file exists
    if [ -f "$file_path" ]; then
        # If the file exists, remove it
        rm "$file_path"
        echo "Rollback: File removed: $file_path"
    else
        echo "Rollback: File does not exist: $file_path"
        exit 1;
    fi
}
    # Prompt the user for the number of rollback steps
    echo -e -n "${YELLOW}Alert${RESET}: ${YELLOW}How many rollback steps you need to take${RESET}? default:${YELLOW}1${RESET}): "
    read -r lines_to_read

    # Set default value if no input is provided
    if [ -z $lines_to_read ]; then
        lines_to_read=1
    fi

# Read the last $lines_to_read lines from the log file
last_lines=$(tail -n "$lines_to_read" "$log_file")

# Check if the log file exists
if [ ! -f "$log_file" ]; then
    echo "Log file does not exist. No rollback operations performed."
    exit 1
fi



# Read the last $lines_to_read lines from the log file and process each line
tail -n "$lines_to_read" "$log_file" | while IFS= read -r line; do
  # Check if the line has already been marked as rolled back
    if [[ $line  == *"- Rolled back"* ]]; then
        echo -e "${YELLOW}Line already marked as rolled back: $line${RESET}"
        continue
    fi
    
    # Extract the file path from the log line
    file_path=$(echo "$line" | cut -d "'" -f2)

    # Check if the file exists and if it can be rolled back
    if [ -f "$file_path" ]; then
        rollback_file_creation "$file_path"
        rollback_occurred=true
        echo -e "${YELLOW}Rollback completed.${RESET}"
    else
        echo -e "${RED}File does not exist: $file_path. Cannot perform rollback.${RESET}"
        exist 1
    fi

    # Mark the line as rolled back in the log
    echo "${line} - Rolled back" >> "$log_file.tmp"
done

# Append any remaining lines from the original log file to the temporary log file
tail -n +"$((lines_to_read + 1))" "$log_file" >> "$log_file.tmp"

# Replace the original log file with the updated one
if [ -f "$log_file.tmp" ]; then
    mv "$log_file.tmp" "$log_file"
fi


