# Infera Worker Node

## Overview

Download the worker script using a curl command or download the files through github.

## Prerequisites

Ensure you have the following installed and running on your system:

- **Ollama**: [Download Ollama](https://ollama.com/download)

## Windows Installation and Start-Up

Download this repository, extract the folder, and drag and drop ```Infera.exe``` to your desktop.

Double click on the ```Infera.exe``` icon on your desktop and the Infera node will boot up.

Please ensure that Ollama is running or ```Infera.exe``` will not boot up.

## CLI Installation (Mac & Linux)

Open up Terminal and copy and paste the following commands into your command line and press enter to install
the Infera Node.  

### Apple M Series

```
curl -O https://www.infera.org/scripts/install_script_m_chips.sh
chmod +x install_script_m_chips.sh
./install_script_m_chips.sh
echo "alias init-infera='~/infera'" >> ~/.zshrc && source ~/.zshrc
```


### Apple Intel Series

```
curl -O https://www.infera.org/scripts/install_script_intel.sh
chmod +x install_script_intel.sh
./install_script_intel.sh
echo "alias init-infera='~/infera'" >> ~/.zshrc && source ~/.zshrc
```

### Linux

```
curl -O https://www.infera.org/scripts/install_script_linux.sh
chmod +x install_script_linux.sh
./install_script_linux.sh
```

## Start Up

To start the node, enter the following to your terminal and the node will automatically start
```
init-infera
```

## Update and re-install

To update Infera on your computer, enter the following command into your Terminal to remove and replace
the depricated version of Infera.

### Apple M Series

```
rm -rf ~/infera
curl -O https://www.infera.org/scripts/install_script_m_chips.sh
chmod +x install_script_m_chips.sh
./install_script_m_chips.sh
```

### Apple Intel Series

```
rm -rf ~/infera
curl -O https://www.infera.org/scripts/install_script_intel.sh
chmod +x install_script_intel.sh
./install_script_intel.sh
```

### Linux

```
rm -rf ~/infera
curl -O https://www.infera.org/scripts/install_script_linux.sh
chmod +x install_script_linux.sh
./install_script_linux.sh
```

## Uninstall

To delete infera from your computer, enter the following command into your Terminal.

```
rm -rf ~/infera
```

## Manage Models & Node

While the node is running, you can install ```llama3:latest``` with CLI using the following terminal
command in a second terminal window.

```
curl -X POST http://localhost:11025/install_new_model \
     -H "Content-Type: application/json" \
     -d '{"install_model_name": "llama3:latest"}'
```

The node should now have ```llama3:latest``` installed and your node is now fully operational on the network.

```llama3:latest``` can also be replace with the following models

```
gemma:latest
gemma2:latest
dolphin-mistral:latest
mistral:latest
llama3:latest
llama3.1:latest
llama2-uncensored:latest
```
Users can also user their browser and go to ```localhost:11025/docs``` to view the node API and see node stats and information.
Models can also be managed under the node API without having to use a terminal curl request.

Infera offers a [Google Extension](https://github.com/inferanetwork/chrome-extension) for users who wish to use a visual interface for accessing their hosted node.
