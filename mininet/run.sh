set -e

# install the stuff.
sudo apt install mininet
sudo apt install wireshark
sudo apt install python3
sudo apt install docker
sudo apt install build-essential

# run the script.
sudo mn --custom ./config.py --topo in5570 -x

# perform cleanup (not strictly nessesary).
sudo mn -c
