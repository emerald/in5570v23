
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

```matlab
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
3. *f_A* and *f_B* have the same name.
4. *f_A* and *f_B* have equally many arguments and results.
5. The argument types of *f_A* conform to those of *f_B*.
6. The return type of *f_B* conforms to that of *f_A*.

In type theory, we say that *f_A* is covariant in the arguments of *f_B*,
but contravariant in the return type of *f_B*.

An object is considered a _type_ whenever it conforms to:

```matlab
% If another object conforms to this object, we consider it a type.
immutable typeobject type
  function getSignature -> [Signature]
end type
```

The special object `Signature` is built-in.

---

# Example (Cartesian Product)

Finish the implementation

```matlab
% A product is something that has two projections.
const Product <- immutable object product_declaration
  export function of [ left : A, right : B  ] -> [ pair : AxB ]
    forall A
    forall B
    where AxB <-
      typeobject product_interface
        function first  -> [ A ]
        function second -> [ B ]
      end product_interface
    pair <-
      immutable object product_implementation
        % ... Your code goes here ...
      end product_implementation
  end of
end product_declaration
```

---

# Something that does not work (recursive types)

```matlab
const ListType <-
  immutable object _
    export function of [ A : type ] -> [ ListOfAs : type ]
      forall A
      ListOfAs <-
        typeobject interface
          function length -> [ integer        ]
          function head   -> [ A              ]
          function tail   -> [ ListType.of[A] ] % infinite recursion.
        end interface
    end of
  end _
```

(use the built-ins `Array` and/or `Vec` instead).

---

# Example (Ephemeral Stack)

Consider the type:

```matlab
% A stack is something that supports push, pop and size.
const StackType <- immutable object declaration
  export function of [ A : type ] -> [ StackOfAs : type ]
    forall A
    StackOfAs <-
      typeobject interface
        operation push    [ A ]
        operation pop  -> [ A ]
        function  size -> [ integer ]
      end interface
  end of
end declaration
```

and finish the implementation:

```matlab
% Stack.of[Integer] returns an empty stack.
const Stack <- immutable object library
  export function of [ A : type ] -> [ StackOfAs : StackType.of[A] ]
  % Your code goes here.
end library
```

---

# Classes

An object declared with the special keyword `class` will automatically have
an extra function called `create` of a certain arity. For instance, the
object:

```matlab
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

```matlab
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

```matlab
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

```matlab
const Primes <-
  typeobject Emumerator
    operation next -> [ prime : Integer ]
  end Emumerator
```

The first result of calling `next[]` should be `2`.
How many primes are there between 0 and 200?
