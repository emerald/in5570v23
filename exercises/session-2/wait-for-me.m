
const wait_for_me <-
  monitor class i_am_late

    const invocation <- Condition.create

    export operation stop
      wait invocation
    end stop

    export operation come_on
      signal invocation
    end come_on

  end i_am_late

% 1. Make an object that waits for `wait_for_me` and prints to the screen.
% 2. Run it a couple of times.
% 3. Does it work?
