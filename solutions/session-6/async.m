
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
        monitor object implementation

          var deferred : B
          var done     : boolean   <- false
          var finished : condition <- condition.create

          export operation computation [ computed : B ]
            done     <- true
            deferred <- computed
            signal finished
          end computation

          export function await -> [ result : B ]
            if   ! done
            then wait finished
            end if
            result <- deferred
            signal finished
          end await

          export function poll -> [ ready : boolean ]
            ready <- done
          end poll
        end implementation

      const _ <-
        object deferred_computation
          process
            % Since we already said to emerald that `Defer` is a `Task.of[B]`, it
            % needs a little help, realising that we also implemented an extra method.
            const Hack <-
              view Defer as
                typeobject _
                  operation computation [ B ]
                end _
            const the_b <- view f.of[x] as b
            Hack.computation[ the_b ]
          end process
        end deferred_computation

    end call
  end definition
