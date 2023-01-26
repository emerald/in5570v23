
% Prints a greeting to standard of all active nodes.
const HelloWorld <-
  object program
    process
    for contact in (locate self)$activenodes
      contact$thenode$stdout.putstring["hello world\n"]
      end for
    end process
  end program
