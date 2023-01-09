.PHONY: environment clean fresh
.SILENT:

run=gnome-terminal --

environment:
	docker run \
	  --interactive --tty --rm \
	  --volume "$(shell pwd):/home/docker/src/" \
	  --workdir "/home/docker/src/" \
	  portoleks/in5570v21:latest

fresh:
	$(run) $(MAKE) environment

clean:
	find . -type f -name '*.x' -delete
