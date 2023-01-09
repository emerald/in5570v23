.PHONY: connection lab-session
.SILENT:

key=~/.ssh/id_rsa
slice_name=diku_IN5570
run=gnome-terminal --
your-folder=test

connection:
	ssh -o StrictHostKeyChecking=no -l $(slice_name) -i $(key) $(server)

lab-session:
	for f in $$(cat good-nodes.txt) ; do $(run) $(MAKE) connection server=$$f ; done

copy:
	for f in $$(cat good-nodes.txt) ; do scp -i ~/.ssh/id_rsa $(file) diku_IN5570@$$f:/home/diku_IN5570/$(your-folder)/ ; done

# on each machine, run:
# cd <your-folder> ; ./install-emerald.sh
setup:
	for f in $$(ls ../emerald/bin32) ; do $(MAKE) copy file=../emerald/bin32/$$f ; done
	$(MAKE) copy file=./script/install-emerald.sh
	$(MAKE) copy file=../emerald/emerald-0.99-linux.tar.gz
	$(MAKE) copy file=../emerald/.profile
	$(MAKE) lab-session
