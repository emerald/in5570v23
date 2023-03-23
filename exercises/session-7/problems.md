

# IN[59]570 Exercise Session 7

Petra, charta, forcipe

Joachim Tilsted Kristensen
`joachkr@ifi.uio.no`

University of Oslo,
March 23, 2023

---

# General feedback (Oblig 2).

---

# Rock, Paper Scissors.

(The following exercises are based on an assignment formulated by Ken Friis
Larsen `(kflarsen@diku.dk)` for a course at The University of Copenhagen).

This exercise is about making a game server for the rock--paper--scissors
game. A game of rock--paper--scissors is a best-of-$N$ rounds, where the
game consist ends when a player wins $N/2$ rounds.

The game server consists of a *game broker* and a number of *game
coordinators*. The broker takes care of matching up players, and then
assign a (perhaps newly started) coordinator when two players have been
matched up. The coordinator orchestrates a game (consisting of a number
of rounds) between two players.

Implement two factory objects called `Broker` and `Coordinator`.

The `Broker` should have a method `queue[rounds : integer] -> [game :
Coordinator]` , that players may use to queue up at the server.

The `Coordinator` should have three methods `rock[] -> [resolution]`,
`paper[] -> [resolution]` and `scissors[] -> [resolution]`.

Start by choosing a proper way of resolving a round. Should `Coordinator` be
a monitor? what is a suitable type for `resolution` and so on.

---

# Challenge

Define a class `NPC[Broker]` that queues up different players. Find a
suitable object representation of a rock--paper--scissors strategy.

Now, you can play rock paper scissors via remote method invocation with NPCs
placed around planet lab, you can also set up games between NPCs to see
which strategies beat eachother `{^_^}`.

Happy coding.

---

# Home Exam 1.

If you pick a couple of integers $z$, $w$ and $d$ to have the properties
$w < d$, $1 < z < 2^w - 1$. Then, we can call an array of length $2^d$
an $d$ dimensional array, and define a function:

$h(x) = ( (z \cdot x)\ mod\ 2^w )\ div\ 2^{w-d}$

is a 2-universal hash function. I will give a brief explaination of why that
is, and why that is useful.
