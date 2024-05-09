#!/bin/bash

# Set the path to the stub file for making a view
stubs_dir="commands/stubs/make-view.stub"

# Directory where views will be stored
views_dir="src/views"

# Extract the view name from the command-line argument
view_path=$1
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'

if [ -z "$view_path" ]; then
  echo -e "${YELLOW}Usage:npm run make:view <view_path>"
  echo -e "${RED}ERROR: <view_path> is required!${RESET}"
  exit 1
fi
if [ -e "$views_dir/$view_path.vue" ]; then 
    echo -e -n "${YELLOW}Alert${RESET}: ${YELLOW}'$view_path.vue' already exists. Do you want to overwrite it? ${RESET}(${RED}y${RESET}/${YELLOW}n${RESET}): "
    read -r overwrite
    if [ "$overwrite" != "y" ]; then
      echo -e "${YELLOW}Alert: Aborted.${RESET}"
      exit 0
    fi
fi
# Create the views directory if it doesn't exist
mkdir -p "$views_dir"

# Create the directory structure if it doesn't exist
mkdir -p "$views_dir/$(dirname $view_path)"

# Stub content for the Vue component
view_name=$(basename $view_path)
stub_content=$(<"$stubs_dir")

# Create the Vue component file
echo "$stub_content" > "$views_dir/$view_path.vue"

echo -e "${GREEN}View '$view_path.vue' created in 'views' directory.${RESET}"
