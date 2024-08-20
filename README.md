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



