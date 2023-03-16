

# IN[59]570 Exercise Session 6

Aliquando, magni momenti est petere licentiam

Joachim Tilsted Kristensen
`joachkr@ifi.uio.no`

University of Oslo,
March 16, 2023

---

(The following exercises are inspired by a similar exercises formulated by
Ken Friis Larsen `(kflarsen@diku.dk)` for a course at The University of
Copenhagen).

---

# General resubmissions.

Put a comment on a structure, to describe what it is:

```matlab
% A buffer is something you can add and remove elements from.
const Buffer <-
  immutable object declaration
    export function of [ A : type ] -> [ BufferType : type ]

      forall A

      BufferType <-
        typeobject interface
          operation add       [ A ]
          operation remove -> [ A ]
        end interface

    end of
  end declaration
```

Add a comment when something is unusual or particularly important:

```matlab
% A bounded buffer is a special buffer that has a `size`.
const BoundedBuffer <-
  immutable object definition
    export function of[ size : integer, A : type ] -> [ Bounded : Buffer.of[A] ]

      forall A

      Bounded <-
        monitor object implementation
          ...

          % When the number of elements is `size`, the caller has to wait for
          % elements to be consumed.
          export operation add [ x : A ] -> []
            ...
```

---

# Object oriented design (async).

Write a library for running tasks asynchronously and waiting for their
results. Implement an Emerald program `async.m`, to provide three object
classes:

```matlab

% An asynchroneous task, is a computation that you can wait for, or you can
% ask if it is ready.
const Task <-
  immutable object definition
    export function of [A : type] -> [Task : type]
      forall A

      Task <- typeobject interface
                 function await [] -> [ result : A ]
                 function poll  [] -> [ ready  : boolean ]
               end interface
    end of
  end definition

% Anything `f` that implements a function `f.of[x]` is called runnable.
const Runnable <-
  immutable object definition
    export function of [A : type, B : type] -> [ Call : type ]

      forall A
      forall B

      Call <-
        typeobject interface
          function of [ argument : A ] -> [ result : B ]
        end interface
    end of
  end definition

const Async <-
  immutable object definition
    export function call [ f : Fun , x : A ] -> [ Defer : Compute ]

      forall A
      forall B
      where  Fun     <- Runnable.of[A, B]
      where  Compute <- Task.of[B]

      Defer <-
        ... [your code here] ...
    end call
  end definition

```

For any `Task` T, the semantics of `poll` and `async` should be:

  * `poll[]` should check wether an asynchronous task has completed
    yet. If it has not completed yet, then the result is `false`.

  * `async[]` that waits for an asynchronous action to complete, and return
    the value of the computation. If the action has already completed, then
    `async[]` should just return immediately.

---

# Challenge:

Extend the API of `Task`, with an operation `any[asyncs]`, that takes
as argument an array of `Task.of[A]`, and returns whenever some `A` is
ready.

# Home exam 1.

You will be asked to design an API in the Home exam. We will talk about how.

