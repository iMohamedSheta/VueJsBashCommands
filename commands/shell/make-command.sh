#!/bin/bash

# Directory where stub will be stored
stubs_dir="commands/stubs"

# Directory where command will be stored
commands_dir="commands/shell"

# Set the path to the stub file for making a command
command_stub_path="$stubs_dir/make-command.stub"
stub_path="$stubs_dir/stub.stub"

# Extract the command name from the command-line argument
created_command_path=$1

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'

if [ -z "$created_command_path" ]; then 
    echo -e "${YELLOW}Usage:npm run make:command <command_path>"
    echo -e "${RED}ERROR: <command_path> is required!${RESET}"
    exit 1
fi

if [ -e "$commands_dir/$created_command_path.sh" ]; then 
    echo -e -n "${YELLOW}Alert${RESET}: ${YELLOW}'$created_command_path.sh' already exists. Do you want to overwrite it? ${RESET}(${RED}y${RESET}/${YELLOW}n${RESET}): "
    read -r overwrite
    if [ "$overwrite" != "y" ]; then
      echo -e "${YELLOW}Alert: Aborted.${RESET}"
      exit 0
    fi
fi

if [ -e "$stubs_dir/$created_command_path.stub" ]; then 
    echo -e -n "${YELLOW}Alert${RESET}: ${YELLOW}'$(basename $created_command_path).stub' already exists. Do you want to overwrite it? ${RESET}(${RED}y${RESET}/${YELLOW}n${RESET}): "
    read -r overwrite
    if [ "$overwrite" != "y" ]; then
      echo -e "${YELLOW}Alert: Aborted.${RESET}"
      exit 0
    fi
fi

# Create the commands, stubs directory if doesn't exists
mkdir -p "$stubs_dir"
mkdir -p "$commands_dir"

# Create the directory structure if it doesn't exist
mkdir -p "$stubs_dir/$(dirname $created_command_path)"
mkdir -p "$commands_dir/$(dirname $created_command_path)"

#Stub for the command and stub.
command_stub_content=$(<"$command_stub_path")
stub_content=$(<"$stub_path")

echo "$stub_content" > "$stubs_dir/$created_command_path.stub"
echo "$command_stub_content" > "$commands_dir/$created_command_path.sh"

echo -e "${YELLOW}Created Stub${RESET}:${GREEN} '$(basename $created_command_path).stub' created in '$stubs_dir/$(dirname $created_command_path)' directory."
echo -e "${YELLOW}Created Command${RESET}:${GREEN}  '$(basename $created_command_path).sh' created in '$commands_dir/$(dirname $created_command_path)' directory. ${RESET}"
