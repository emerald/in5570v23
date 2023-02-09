

# IN[59]570 Exercise Session 2

Introduction to Oblig 1.

Joachim Tilsted Kristensen
`joachkr@ifi.uio.no`

University of Oslo,
February 02, 2023

---

Review the revised exercises from last time, and check your solution with
the solutions in `solutions/session-1` on GitHub.

---

Here is a more advanced version of the `hello world` program, that prints to
standard out of all connected nodes. Extend the program, to use `move`.
Consult the Emerald language report for the semantics of `move`.

```matlab
%                           - -
%                         { 0 0 }
% +===================oOO===(_)===OOo===============+
const WotchIt <-
  object program
    process

      % Greetings.
      const home <- locate self
      stdout.putstring[ "Starting at " || home$LNN.asstring || "\n" ]

      % A counter, and a list of places to go.
      var network : NodeList <- home$activenodes

      % Meet up all nodes in the network.
      for contact in network
        const here <- locate self
        const host <- contact$theNode
        % Remote Method invocation.
        host$stdout.putstring["Comming over. Kind regards, Kilroy\n"]
        % ... call move here ...
      end for

      % Report.
      stdout.putstring["I am done\n"]

    end process
  end program
```

The object `program`, should move it self to the other nodes and then back.

---

# Monitors and conditions

The keyword `monitor` can generally be put in the same places as the word
`object`, and it defines a "monitored" object. (Read Tony Hoare's
"Monitors : an operating systems concept" and come back here.

```matlab
const wait_for_me <-
  monitor class i_am_late

    const invocation <- Condition.create

    export operation stop
      wait invocation
    end stop

    export operation come_on
      signal invocation
    end come_on

  end i_am_late

```

The object `wait_for_me`, is a monitored object. It essentially means that
you can call a method on it, with guaranteed mutual exclusion.

It starts by creating a `condition`. You wait for this condition by calling
`stop`, and you can signal it by calling `come_on`.

1. Make an object that waits for `wait_for_me` and prints to the screen.
2. Make another object that calls `come_on`.
3. Run it a couple of times.
4. Does it work?

---

# Challenge.

1. Extend `wait_for_me` with a method `semi_stop` that takes an extra
   argument `t` of type `time`. The semantics of `semi_stop` should be that if
   `invocation` has not been signalled within `t` time. `wait_for_me` should
   continue without waiting further.

2. What do you need to extend the cyclic barrier from the Oblig to support a
   timeout?

3. Extend the cyclic write barrier from the oblig with an API call that
   waits for the barrier for 10 seconds, and then continues if the barrier
   has not been signalled.
