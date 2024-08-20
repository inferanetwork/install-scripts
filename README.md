# Worker Node

## Overview

This project contains the components to the Infera worker. The Infera worker recieves jobs from the load balancer and then processes and uploads the results to the load balancer storage system.

## Prerequisites

Ensure you have the following installed and running on your system:

- **Ollama**: [Download Ollama](https://ollama.com/download)

## Installation 

Download the shell script from github to your desktop for your operating system

Mac: (M-series Chip) ```install_script_m_chips.sh```
     (Intel Chip) ```install_script_intel.sh```

Linux: ```install_script_linux.sh```

Windows: Coming soon

Open Terminal and use the following commands to download and install the Infera

### Apple M Series

```
cd Desktop
chmod +x install_script_m_chips.sh
./install_script_m_chips.sh
echo "alias infera='~/infera'" >> ~/.zshrc && source ~/.zshrc
```

### Linux

```
cd Desktop
chmod +x install_script_m_chips.sh
./install_script_linux.sh
```

## Start Up

To start the node, enter the following to your terminal and the node will automatically start

```
init-infera
```


## Manage Models

While the node is running, you can install ```llama3:latest``` with CLI using the following terminal command

```
curl -X POST http://localhost:11025/install_new_model \
     -H "Content-Type: application/json" \
     -d '{"install_model_name": "llama3:latest"}'
```
The node should now have ```llama3:latest``` installed and your node is now fully operational on the network


Infera offeres a google extension where users are able to install/remove models from their node and see their node information 
