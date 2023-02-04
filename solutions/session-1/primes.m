
% signature.
const Primes <-
  typeobject Emumerator
    operation next -> [ prime : Integer ]
  end Emumerator

const PrimeFactory <-
  immutable object factory
    export function produceEnumerator -> [enumerator : Primes]

      enumerator <-
        object implementation

          var current : integer

          initially
            current <- 2
          end initially

          export function next -> [ prime : integer ]
            var isPrime : boolean
            var divisor : integer
            prime <- current
            if   current > 2
            then
              loop
                current <- current + 2
                divisor <- 2
                isPrime <- true
                loop
                  if   current # divisor == 0
                  then isPrime <- false
                  end if
                  divisor <- divisor + 1
                  exit when divisor * divisor > current
                end loop
                exit when isPrime
              end loop
            else
              current <- 3
            end if
          end next
        end implementation

    end produceEnumerator
  end factory

const Program <-
  object Main
    initially
      const primes <- PrimeFactory.produceEnumerator
      var prime : integer
      var count : integer <- 0
      loop
        prime <- primes.next
        exit when prime > 200
        count <- count + 1
      end loop
      stdout.putstring["There are : " || count.asstring || " primes between 0 and 200\n"]
    end initially
  end Main
