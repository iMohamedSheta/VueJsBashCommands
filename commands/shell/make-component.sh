#!/bin/bash

# Set the path to the stub file for making a component
stubs_path="commands/stubs/make-component.stub"

# Directory where components will be stored
components_dir="src/components"

# Extract the component name from the command-line argument
component_path=$1

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'


if [ -z "$component_path" ]; then
  echo -e "${YELLOW}Usage:npm run make:component <component_path>"
  echo -e "${RED}ERROR: <component_path> is required!${RESET}"
  exit 1
fi

if [ -e "$components_dir/$component_path.vue" ]; then 
    echo -e -n "${YELLOW}Alert${RESET}: ${YELLOW}'$component_path.vue' already exists. Do you want to overwrite it? ${RESET}(${RED}y${RESET}/${YELLOW}n${RESET}): "
    read -r overwrite
    if [ "$overwrite" != "y" ]; then
      echo -e "${YELLOW}Alert: Aborted.${RESET}"
      exit 0
    fi
fi
# Create the components directory if it doesn't exist
mkdir -p "$components_dir"

# Create the directory structure if it doesn't exist
mkdir -p "$components_dir/$(dirname $component_path)"

# Stub content for the Vue component
component_name=$(basename $component_path)


# Replace placeholders in the stub file with actual values and create the Vue component file
sed "s/{{name}}/$(basename $component_path)/g" "$stubs_path" > "$components_dir/$component_path.vue"



echo -e "${GREEN}Component '$component_path.vue' created in 'components' directory. ${RESET}"
