

# IN[59]570 Exercise Session 4

Concurrentum is bonum

Joachim Tilsted Kristensen
`joachkr@ifi.uio.no`

University of Oslo,
February 23, 2023

---

# Lets talk about synchronization.

discuss with the person on your right.

1. What is a monitor?
2. What is the purpose of a monitor.
3. What are alternatives to a monitor?
4. What is a message passing?
5. How do you get mutual exclusion with a monitor?
6. How do you get mutual exclusion with message passing.
7. Are they equivalent kinds of message passing?

---

# Parameter Parsing.

The version of `Emerald` we handed out implements
`call-by-object-reference`. Which means that a variable is essentially
implemented by a pointer to a structure.

It could have implemented `call-by-move` or `call-by-visit`. See Eric's
notes on how to implement `call-by-visit`.

Now, suppose an object `A` on node `N1` has a function `f` and we call
`A.f[B]` on an object `B` located at another node `N2`. As a function of how
many times `f` uses `B`, and how large `B` is, when is it faster to use
`call-by-visit`?

---

# Attachments.

Look up the keyword `attach` in the language report.

1. What are the semantics of `attach`?
2. Look in the (standard library)[https://github.com/emerald/src-versions/tree/master/ubc-latest-src/Builtins] for a ussage of `attach`.
3. Why did the library implementer use `attach` here?

---
