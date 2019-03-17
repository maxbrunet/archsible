all: archsible.box

%.box: %.json
	@packer build -on-error=ask $<

.PHONY: vm
vm:
	@vagrant box add archsible.box --name archsible
	@vagrant up

.PHONY: clean
clean:
	@vagrant destroy
	@vagrant box remove archsible || true
	@mkdir archives || true
	@echo 'Moving box to archives...'
	@mv archsible.box archives/archsible_$$(date +%Y%m%d%H%M).box
