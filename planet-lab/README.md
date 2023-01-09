# PlanetLab Status Report

Updated: 2022-12-08

  * [Planet Lab Europe nodes in the diku_IN5570 slice](diku_in5570_slice.txt): 813
  * [Good nodes in the diku_IN5570 slice](good-nodes.txt): 2

What classifies as a good node:

  * Reachable from Oslo within a 5-second delay
  * Can ping google.com

## Scripts

### [`ping.py`](ping.py)

Given a list of nodes via standard input, finds the good ones among
them (see definition of a good node above). For instance:

```bash
$ cat diku_in5570_slice.txt | python3 ping.py
```

The script depends on a couple of libraries for python2 that you can install
(or verify that you have installed) by running:

```bash
$ pip install -r ping-dependencies.txt
```

The script **also** assumes that you have an SSH agent running with
your PlanetLab key added.
