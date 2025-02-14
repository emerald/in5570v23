set -e

# make sure you have the latest versions of stuff
sudo apt update
sudo apt upgrade -y

# install the stuff.
sudo apt install mininet
sudo apt install wireshark
sudo apt install python3
sudo apt install docker
sudo apt install build-essential

# initiate topology.
sudo mn --custom ./config.py --topo in5570 -x

# perform cleanup.
sudo mn -c
