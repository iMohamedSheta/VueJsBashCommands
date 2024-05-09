#!/bin/bash


#-------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------
#
#  ███╗   ███╗ ██████╗ ██╗  ██╗ █████╗ ███╗   ███╗███████╗██████╗     ███████╗██╗  ██╗███████╗████████╗ █████╗ 
#  ████╗ ████║██╔═══██╗██║  ██║██╔══██╗████╗ ████║██╔════╝██╔══██╗    ██╔════╝██║  ██║██╔════╝╚══██╔══╝██╔══██╗
#  ██╔████╔██║██║   ██║███████║███████║██╔████╔██║█████╗  ██║  ██║    ███████╗███████║█████╗     ██║   ███████║
#  ██║╚██╔╝██║██║   ██║██╔══██║██╔══██║██║╚██╔╝██║██╔══╝  ██║  ██║    ╚════██║██╔══██║██╔══╝     ██║   ██╔══██║
#  ██║ ╚═╝ ██║╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║███████╗██████╔╝    ███████║██║  ██║███████╗   ██║   ██║  ██║
#  ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═════╝     ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝
#--------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------


# Associative array to store file types and their respective stub file paths and output directories
declare -A file_types

# Function to register a new file type
register_file_type() {
  local file_type=$1
  local stub_path=commands/stubs/$2
  local output_dir=$3
  
  file_types["$file_type"]="$stub_path $output_dir"
}

#Colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'


## /*
# |-----------------------------------------------------------------------------
# | What is this script and How to use it?                       
# |-----------------------------------------------------------------------------
# |
# | This shell script simplifies the creation of files with predefined templates.
# | 
# | To set up new file types:
# | 
# | 1. Define a new file type using the register_file_type function with three arguments:
# |    ['type', 'stub_path', 'created_file_dir'].
# |     
# |    Example:
# |    ```
# |    register_file_type "component" "$make_component_stub" "$components_dir"
# |    register_file_type "view" "$make_view_stub" "$views_dir"
# |    ```
# |  
# | To add a new command for generating files:
# | 
# | 1. Open the "package.json" file.
# | 
# | 2. Add a new script entry using the format:
# |    ```
# |    "make:<your_command>": "bash commands/shell/make.sh <your_command>"
# |    ```
# |    Replace "<your_command>" with your desired command name.
# | 
# | 3. Ensure the shell script path and arguments are correctly configured.
# | 
# | Note: "make.sh" must be located in the "commands/shell" directory and properly configured.
# |
# | To execute the script:
# | 
# | - Use the following command format:
# |    ```
# |    npm run make:<file_type> <file_path>
# |    ```
# |    Replace `<file_type>` with the desired file type (e.g., component, view) 
# |    and `<file_path>` with the desired file path.
# | 
# |    Example:
# |    ```
# |    npm run make:component src/components/Button
# |    npm run make:view src/views/Home
# |    ```
# | 
# | Ensure that the stub files and output directories are properly configured before execution.
# | 
# |
## */

#-------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------
#
#   ██████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ███████╗    ██╗  ██╗███████╗██████╗ ███████╗
#  ██╔════╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██╔════╝    ██║  ██║██╔════╝██╔══██╗██╔════╝
#  ██║     ███████║███████║██╔██╗ ██║██║  ███╗█████╗      ███████║█████╗  ██████╔╝█████╗  
#  ██║     ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══╝      ██╔══██║██╔══╝  ██╔══██╗██╔══╝  
#  ╚██████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗    ██║  ██║███████╗██║  ██║███████╗
#   ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
#                                                                                         
#--------------------------------------------------------------------------------------------------------------


# Directory where components and views will be stored
components_dir="src/components"
views_dir="src/views"

# Set the path to the stub files for different file types
make_component_stub="make-component.stub"
make_view_stub="make-view.stub"


# Registering default file types
register_file_type "component" "$make_component_stub" "$components_dir"
register_file_type "view" "$make_view_stub" "$views_dir"


# -------------------------------------------------------------------------------------------------------------
#
#   ██████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ███████╗    ██╗  ██╗███████╗██████╗ ███████╗
#  ██╔════╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██╔════╝    ██║  ██║██╔════╝██╔══██╗██╔════╝
#  ██║     ███████║███████║██╔██╗ ██║██║  ███╗█████╗      ███████║█████╗  ██████╔╝█████╗  
#  ██║     ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══╝      ██╔══██║██╔══╝  ██╔══██╗██╔══╝  
#  ╚██████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗    ██║  ██║███████╗██║  ██║███████╗
#   ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
                                                                                        
# -------------------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------------------


# Log file path
log_file="commands/shell/log/make.log"

# Function to log file creation
log_file_creation() {
  local file_type=$1
  local file_path=$2
  echo "$(date +"%Y-%m-%d %H:%M:%S"): Created $file_type file at '$file_path'" >> "$log_file"
}

# Function to create a file based on stub content
create_file() {
  local file_type=$1
  local file_path=$2
  
  if [ -z "$file_path" ]; then
    echo -e "${YELLOW}Usage: $file_type <file_path>"
    echo -e "${RED}ERROR: <file_path> is required!${RESET}"
    return 1
  fi

if [ ! "${file_types["$file_type"]}" ]; then
    echo -e "${RED}ERROR: Invalid file type '$file_type'.${RESET}"
    return 1
  fi

  local stub_path output_dir
  read -r stub_path output_dir <<< "${file_types["$file_type"]}"

  if [ -e "$output_dir/$file_path.vue" ]; then 
    echo -e -n "${YELLOW}Alert${RESET}: ${YELLOW}'$file_path' already exists. Do you want to overwrite it? ${RESET}(${RED}y${RESET}/${YELLOW}n${RESET}): "
    read -r overwrite
    if [ "$overwrite" != "y" ]; then
      echo -e "${YELLOW}Alert: Aborted.${RESET}"
      return 0
    fi
  fi

  # Create the output directory if it doesn't exist
  mkdir -p "$output_dir"

  # Create the directory structure if it doesn't exist
  mkdir -p "$output_dir/$(dirname $file_path)"

  # Replace placeholders in the stub file with actual values and create the file
  sed "s/{{name}}/$(basename $file_path)/g" "$stub_path" > "$output_dir/$file_path.vue"

  # Log file creation
  log_file_creation "$file_type" "$output_dir/$file_path.vue"

  echo -e "${GREEN}File '$file_path' created in '$output_dir' directory.${RESET}"
}


# Check the command-line arguments to determine the action
case "$1" in
  make:*)
    file_type=$(echo "$1" | cut -d':' -f2)
    create_file "$file_type" "$2" 
    ;;
  *)
    echo -e "${RED}Invalid command. Usage: npm run make:<file_type> <file_path>${RESET}"
    exit 1
    ;;
esac
