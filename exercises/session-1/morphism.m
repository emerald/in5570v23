export Arrow, Composition

% An arrow `f : A -> B` between two types `A` and `B`, is something that you
% give an `A`, that then gives you back a `B`. We often think of this type
% as a function, and when we apply it to an `a`, we say `f.of[a]`.
const Arrow <- immutable object declaration
  export function of [ A : type, B : type ] -> [ F : type ]

    forall A
    forall B

    F <- typeobject interface

      function of [ A ] -> [ B ]

    end interface

  end of
end declaration

% Arrows compose nicely. For instance, if you have an arrow `f : A -> B` and
% another arrow `g : B -> C`, then you can make a new arrow that takes and
% `A` and gives you back a `C`, by first applying `f` and then applying `g`.
const Composition <- immutable object definition
  export function of [ G : Arrow.of[B, C], F : Arrow.of[A, B] ] -> [ H : Arrow.of[A, C] ]

    forall A
    forall B
    forall C

    H <- object implementation

      export function of [ x : A ] -> [ y : C ]
        y <- G.of[F.of[x]]
      end of

    end implementation

  end of
end definition
