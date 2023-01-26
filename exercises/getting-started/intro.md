
# IN[59]570 Exercise Session 0

Joachim Tilsted Kristensen
`joachkr@ifi.uio.no`

University of Oslo,
January 26, 2023

---

# What is an emerald node?

1. TCP/IP-enabled hardware (host).
2. A runtime system.
3. Uniquely identified by `host:port`.
4. `host` is an IP address or a hostname.
5. `port` is a natural number less than `2^16`.

---

# How do we run an emerald node?

1. Within Docker containers.
2. On a PlanetLab (preinstalled).

---

# Getting Started (Docker).

1. Install Docker.
2. Visit: https://github.com/emerald/in5570v23/ .
3. Modify the Makefile to suit your setup.
4. Using the Makefile, run the command "`make environment`".
5. Alternatively run the command "`make fresh`".

---

# Examples:

Read the code for the following programs:

1. `hello.m`
2. `hello-all.m`

Try to run the programs.
