

# IN[59]570 Exercise Session 3

`ssh`, Oblig 1 and beyond.

Joachim Tilsted Kristensen
`joachkr@ifi.uio.no`

University of Oslo,
February 16, 2023

---

Did anyone solve last weeks challenge?

---

# `ssh`.

1. Go to https://overthewire.org/wargames/bandit/
2. Solve exercises 1-7.
3. You are welcome to solve more exercises (getting familiar with a shell is
   a great skill).

---

# Oblig 1.

Discuss the oblig with the student on your right.

0. Have you installed `ssh`?
1. How do you start up several Emerald nodes at once?
2. How do you start an Emerald node on planet lab?
3. How do you move an object from one node to another.
4. Can you run the Kilroy program on the 4 planet-lab nodes.
5. What should the Kilroy program do?
6. What is a cyclic barrier?

I will come around and talk to you as well.

---

# Echo

Write an Emerald program that echo's the received on stdin to all active
nodes. Let the program end, if it has received the keyword “exit” on stdin.

Hint: You might appreciate the following auxiliary functions, provided by
Oleks from the Emerald organization on GitHub.

```
function stripLast [ i : String ] -> [ o : String ]
  o <- i.getSlice[ 0, i.length - 1 ]
end stripLast
function readline -> [ o : String ]
  o <- self.stripLast [ stdin.getstring ]
end readline
```

---

# Watchdog

In the language report, figure out what the `unavailable` keyword does.
Write a program that loops through the active nodes every second or two, and
reports (by writing to `stdout`), when a node is down.

---

# Pro tip of the day.

The `-R` flag connects an emerald node to another node.
So

```bash
emx -R<host-identifier>:<host-port> [program.x]
```

Connects the runtime of an emerald node to the runtime of another.
