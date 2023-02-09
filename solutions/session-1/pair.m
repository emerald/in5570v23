
const Pair <-
  immutable object value_constructor
    export function of [ left : A , right : B ] -> [ both : AxB ]
      forall A
      forall B
      where AxB <-
        typeobject type_of_pair
          function fst -> [ left  : A ]
          function snd -> [ right : B ]
        end type_of_pair
      % -- end of type
      both <-
        object implementation_of_both
          export function fst -> [ left_projection : A ]
            left_projection <- left
          end fst
          export function snd -> [ right_projection : B ]
            right_projection <- right
          end snd
        end implementation_of_both
    end of
  end value_constructor

const Program <-
  object MainProgram
    process
      const p <- Pair.of[3, true]
      var n : integer <- p.fst
      var b : boolean <- p.snd
      stdout.putstring[ "(" || n.asstring || ", " || b.asstring || ")" || "\n"]
    end process
  end MainProgram
