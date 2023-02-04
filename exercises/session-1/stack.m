export Stack, StackType

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

% Stack.of[Integer] returns an empty stack.
const Stack <- immutable object library
  export function of [ A : type ] -> [ StackOfAs : StackType.of[A] ]

  forall A

  StackOfAs <- object implementation
    const data <- array.of[A].empty

    export operation push [ x : A ]
      data.addUpper[x]
    end push

    export operation pop -> [ x : A ]
      x <- data.removeUpper
    end pop

    export function size -> [ n : integer ]
      n <- data.upperbound + 1
    end size

    end implementation
  end of

end library

% ... Try it out ...
const Program <-
  object Main
    initially
      const s <- Stack.of[integer]
      s.push[3]
      s.push[7]
      stdout.putstring[s.pop.asstring || "\n"]
    end initially
  end Main
