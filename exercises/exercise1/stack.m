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

  StackOfAs <-
    object implementation

      % ..... Your code goes here .....

    end implementation
  end of

  export function map
    [ f       : Arrow.of[A, B] ] ->
    [ Functor : Arrow.of[StackType.of[A], StackType.of[B]] ]

    forall A
    forall B

    Functor <-
      immutable object lifting
        function of [ S : StackType.of[A] ] -> [ T : StackType.of[B] ]

          % ..... Challenge code goes here .....

        end of
      end lifting
  end map
end library
