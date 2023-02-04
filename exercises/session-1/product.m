export Product

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

% ... Try it out ...
const Program <-
  object Main
    initially
      const p <- Product.of[3, true]
      stdout.putstring["(" || p.first.asstring || ", " || p.second.asstring || ")\n"]
    end initially
  end Main
