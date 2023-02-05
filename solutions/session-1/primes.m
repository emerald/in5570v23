
% The declaration from the exercise text.
const Primes <-
  typeobject Emumerator
    operation next -> [ prime : Integer ]
  end Emumerator

% A factory that produces prime enumerators.
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
                isPrime <- true
                divisor <- 2
                loop
                  if   current # divisor == 0
                  then isPrime <- false
                  end if
                  % Challenge :
                  %   Instead of enumerating divisors by +1, you can
                  %   use the primefactory to enumerate prime divisors.
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

% Main program that answers the question in the exercise.
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
      stdout.putstring["There are : " || count.asstring || " prime numbers between 0 and 200\n"]
    end initially
  end Main
