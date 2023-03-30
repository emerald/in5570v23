
% Small hashing library, provides some extra helper functions if you want to
% come up with your own hash-function.
const Hashing <- object Library

    % The java hash function for strings.
    export function hash [ s : String ] -> [ hash_of_s : Integer ]
      var z : integer <- 1337
      for ch  in s
        z <- 31 * z + ch.ord
      end for
      hash_of_s <- z
    end hash

    % Computes `x ^ n`.
    function exponent [ x : integer, n : integer ] -> [ x_n : integer ]
      if n == 0
      then x_n <- 1
      else x_n <- x * self.exponent [x, n - 1]
      end if
    end exponent

    % Bitshifts `x`, `m` steps to the left.
    function shift_left [ x : integer, m : integer ] -> [ x_m : integer ]
      x_m <- x * self.exponent[ 2, m ]
    end shift_left
  end Library
