#!/bin/bash

# Define colors for printing
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Define the file and alias
FILE=~/infera
ALIAS_NAME="init-infera"
ALIAS_STRING="alias $ALIAS_NAME='~/infera'"

# Function to download and set up the file
download_and_setup() {
    # URL of the file on S3
    S3_URL="https://inferabuilds.s3.us-east-1.amazonaws.com/0.0.1_infera_build_mac"

    # Download the file from the S3 bucket
    echo -e "${YELLOW}Downloading the file...${NC}"
    curl -o infera "${S3_URL}"

    # Move the file to ~/
    echo -e "${YELLOW}Moving the file to ~/ ...${NC}"
    sudo mv infera ~/

    # Make the file executable
    echo -e "${YELLOW}Making the file executable...${NC}"
    sudo chmod +x ~/infera
}

# Check if the file already exists
if [ -f "$FILE" ]; then
    echo -e "${GREEN}File already downloaded and located at ~/infera${NC}"
    # Prompt the user for removing the existing file
    read -p "Do you want to remove the existing file and redownload it? (y/n): " choice
    if [ "$choice" = "y" ]; then
        echo -e "${YELLOW}Removing existing file...${NC}"
        sudo rm -f ~/infera
        download_and_setup
    fi
else
    download_and_setup
fi

# Check if the alias already exists in .bashrc
if grep -Fxq "$ALIAS_STRING" ~/.bashrc; then
    echo -e "${GREEN}Alias 'init-infera' already exists in .bashrc${NC}"
else
    # Create an alias for the executable
    echo -e "${YELLOW}Creating alias 'init-infera' for the executable in .bashrc...${NC}"
    echo "$ALIAS_STRING" >> ~/.bashrc
    source ~/.bashrc
fi

# Detect the current shell
CURRENT_SHELL=$(basename "$SHELL")

# Check if the local server is running and returns a 200 status code
echo -e "${YELLOW}Checking if ollama is running locally...${NC}"
STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost:11434/)

if [ $STATUS_CODE -eq 200 ]; then
    echo -e "${GREEN}Ollama server is running!${NC}"
    # Print command to run the executable
else
    echo -e "${RED}Ollama server not running, is it installed? If not follow the instructions here: https://ollama.com/${NC}"
fi


if [ "$CURRENT_SHELL" = "zsh" ]; then
    echo -e "${CYAN}It looks like you are running this script in zsh.${NC}"
    echo -e "${CYAN}To create the alias for zsh, add the following line to your ~/.zshrc file:${NC}"
    echo -e "${CYAN}${ALIAS_STRING}${NC}"
    echo -e "${CYAN}And then run 'source ~/.zshrc' or 'omz reload'${NC}"
    echo -e "${CYAN}ignore this if you are following the github CLI instructions${NC}"
else
    echo -e "${CYAN}To run the executable, use the command: 'init-infera'${NC}"
fi
