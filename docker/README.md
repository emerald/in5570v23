# Running Emerald using Docker instances

You can find a Docker instance with Emerald installed at
[`portoleks/in5570v20`](https://hub.docker.com/r/portoleks/in5570v20).

This is the fastest way to get Emerald to run on your machine.

## Environment

You can compile and run emerald programs from with in the Docker image.
To do so, type in the command

```bash
$ make environment
```

You can exit the instance by typing `Ctrl-D`, or by running the program

```bash
$ exit
```

from within the instance.

## Compiling

Inside the instance, the programs `ec` and `emx` will be available.
The former compiles an emerald file with the extension `.m` into a `.x` file which can be run using the latter.
