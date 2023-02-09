
%                           - -
%                         { 0 0 }
% +===================oOO===(_)===OOo===============+
const WotchIt <-
  object program
    process

      % Greetings.
      const home <- locate self
      stdout.putstring[ "Starting at " || home$LNN.asstring || "\n" ]

      % A counter, and a list of places to go.
      var network : NodeList <- home$activenodes

      % Meet up all nodes in the network.
      for contact in network
        const here <- locate self
        const host <- contact$theNode
        % Remote Method invocation.
        host$stdout.putstring["Comming over. Kind regards, Kilroy\n"]
      end for

      % Report.
      stdout.putstring["I am done\n"]

    end process
  end program
