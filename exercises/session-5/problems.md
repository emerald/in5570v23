

# IN[59]570 Exercise Session 5

Qui historiam non noverunt, eam iterare peribunt

Joachim Tilsted Kristensen
`joachkr@ifi.uio.no`

University of Oslo,
March 02, 2023

---

# Remote procedure call by message passing.

One of the first object oriented langauges to support such a mechanism was SmallTalk (1970).
The mechanism was walled "remote messaging".

```smalltalk
"Client code"
remote_object := (NetNameResolver address: 'planetlab-2.ida.liu.se') lookupName: 'kilroy'.
remote_object greeting.

"Server code"
remote_object := kilroy new.
remote_messaging register: remote_object underName: 'kilroy'.
```

---

# Remote procedure call by method invocation (library).

In a programming language like Python of Java, remote method invocation can
be performed by library functions. Here is an example in `Python`.

```python
# Client code
import Pyro4
kilroy = Pyro4.Proxy("PYRONAME:kilroy")
kilroy.greeting()
# ...

# Server code
import Pyro4
@Pyro4.expose
class kilroy:
    def greeting(self):
        # ...

uri = Pyro4.Daemon().register(kilroy())
Pyro4.locateNS().register("remote_object_name", uri)
# ...
```

---

# Remote procedure call by method invocation (built-in).

```matlab
% Client code
kilroy.greeting()

% Server code
const kilroy <- object % ...
```

---

# Object mobility.

Just like remote procedure call, there are several options, and one is a
library. Forinstance, Java has `JADE` (Java Agent Development Framework).

We can also send the contents of an object in a message as is costumary in
languages such as `Erlang` or `Elixir`.

In Emerald this is also built-in:

```matlab
move kilroy to (locate self)
kilroy.greeting()
```

---

# Discussion

1. What are the pros and cons of having built-in remote method invocation?
2. What is the difference between remote method invocation and sending messages?
3. What are examples of computer systems where the important design decisions involve object mobility?

---

# Parameter Parsing (repitition).

The version of `Emerald` we handed out implements
`call-by-object-reference`. Which means that a variable is essentially
implemented by a pointer to a structure.

`Emerald` could support a more exotic operation invocation semantics,
`call-by-move`. Which means that the objects pointed to by an operations
parameters could be moved to the node at which the invocation is performed.

Why/when would it make sense to do so, and why?

---

# Exercise 1 in the Oblig (break-of-point).

1. What is a break of point?
2. Do we always expect a break-off point?
3. How can we measure the break-off point?
