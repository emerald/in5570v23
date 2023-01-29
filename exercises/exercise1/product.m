export Product, ProductType

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

% A product factory which has conviniently been called `Product`,
% such that `Product.of[a, b] : ProductType.of[typeof[a], typeof[b]]`.
const Product <- immutable object definition
  export function of [ left : A, right : B  ] -> [ pair : ProductType.of[A, B] ]

    forall A
    forall B

    pair <- immutable object implementation

      % ..... Your code goes here .....

    end implementation

  end of
end definition
