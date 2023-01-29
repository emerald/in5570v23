
# IN[59]570 Exercise Session 1

Introduction to Emerald.
(Based on exercises by Oleks Shturmov).

Joachim Tilsted Kristensen
`joachkr@ifi.uio.no`

University of Oslo,
February 02, 2023

---

# Installation

You have several options.

1. Look at exercises from last week.
2. Install linux in a VM, install Docker in the VM.
3. Install Fedora, use the installation guide for PlanetLab machines.
4. Send me an email.

---

# Hello World

Here is a program:

```prolog
% Prints a greeting to standard out.
const Program <-
  object greeting
    process
      stdout.putstring["hello world\n"]
    end process
  end greeting
```

Use `ec` to compile, and `emx` to run:

```bash
$ ec  hello.m
$ emx hello.x
hello world
$ _
```

---

# Objects as Types

An object *A* _conforms_ to another object *B* precisely iff:
1. If *B* is immutable, then *A* is immutable.
2. If *B* has an operation *f_B* then *A* also has an operation *f_A*.
3. *f_A* and *f_B* are contravariant with respect to conformity.

An object is considered a _type_ whenever it conforms to:

```prolog
% If another object conforms to this object, we consider it a type.
immutable typeobject type
  function getSignature -> [Signature]
end type
```

The special object `Signature` is built-in.

---

# Example (Cartesian Product)

Consider the following type

```matlab
% A product is something that has two projections.
% We call these projections `first` and `second`.
const ProductType <- immutable object declaration
  export function of [ A : type, B : type ] -> [ AxB : type ]
    forall A
    forall B
    AxB <- immutable typeobject interface
      function first  -> [ A ]
      function second -> [ B ]
    end interface
  end of
end declaration
```

and finish the implementation

```matlab
% A product factory which has conviniently been called `Product`,
% such that `Product.of[a, b] : ProductType.of[typeof[a], typeof[b]]`.
const Product <- immutable object definition
  export function of [ left : A, right : B  ] -> [ pair : ProductType.of[A, B] ]
    forall A
    forall B
    pair <- immutable object implementation
      % Your code goes here.
    end implementation
  end of
end definition
```

---

# Something that does not work (recursive types)

```prolog
const ListType <-
  immutable object _
    export function of [ A : type ] -> [ ListOfAs : type ]
      forall A
      ListOfAs <-
        immutable typeobject interface
          function length -> [ integer        ]
          function head   -> [ A              ]
          function tail   -> [ ListType.of[A] ]
        end interface
    end of
  end _
```

(use the built-ins `Array` and/or `Vec` instead).

---

# Example (Ephemeral Stack)

Consider the type:

```prolog
% A stack is something that supports push, pop and size.
const StackType <- immutable object declaration
  export function of [ A : type ] -> [ StackOfAs : type ]
    forall A
    StackOfAs <- typeobject interface
      operation push    [ A ]
      operation pop  -> [ A ]
      function  size -> [ integer ]
    end interface
  end of
end declaration
```

and finish the implementation:

```prolog
% Stack.of[Integer] returns an empty stack.
const Stack <- immutable object library
  export function of [ A : type ] -> [ StackOfAs : StackType.of[A] ]
  % Your code goes here.
end library
```

---

# Challenge (Functor abstraction).

Look at the provided library `morphism.m`, extend your implementation of
`Stack` to include a function:

```prolog
  export function map
    [ f       : Arrow.of[A, B] ] ->
    [ Functor : Arrow.of[StackType.of[A], StackType.of[B]] ]
    forall A
    forall B
    Functor <- immutable object lifting
      function of [ S : StackType.of[A] ] -> [ T : StackType.of[B] ]
        % Your code goes here.
      end of
    end lifting
  end map
```

---

# Classes

An object declared with the special keyword `class` will automatically have
an extra function called `create` of a certain arity. For instance, the
object:

```prolog
const Person <- class Person [ name : String ]
  export function getname -> [ result : String ]
    result <- name
  end getname
end Person

const Main <-
  object program
    initially
      const who <- Person.create["Joachim"]
      stdout.putstring[who$name || "\n"]
    end initially
  end program
```

---

# Inherritance

Inheritance just increments the arity of `create`:

```prolog
const Teacher <- class Teacher ( Person ) [ department : String ]
  export function getDepartment -> [ what : String ]
    what <- department
  end getposition
end Teacher

const Main <-
  object program
    initially
      const ta <- Teacher.create["Joachim", "PROG/PT"]
      stdout.putstring[ta$name       || "\n"]
      stdout.putstring[ta$department || "\n"]
    end initially
  end program
```

---

# Conformity (continued)

```prolog
const FromString <-
  typeobject _
    function f [ a : String ] -> [ b : Any ]
  end _

const ToString <-
  typeobject _
    function f [ a : Any ] -> [ b : String ]
  end _
```

Does `ToString` conform to `FromString`.
How about visa versa?

---

# Generating Primes

Implement an object that conforms to:

```prolog
const Primes <-
  typeobject Emumerator
    operation next -> [ prime : Integer ]
  end Emumerator
```

The first result of calling `Primes.next[]` should be `2`.
How many primes are there between 0 and 200?
