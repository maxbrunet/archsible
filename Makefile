all: archsible.box

%.box: %.json
	@packer build -on-error=ask $<

.PHONY: clean
clean:
	@vagrant destroy
	@vagrant box remove archsible
	@rm *.box
