SHELL := /usr/bin/env bash

all: boxes/archsible.box

boxes/%.box: packer/%.yaml
	@packer build -on-error=ask <(scripts/yaml2json.rb < $<)

.PHONY: vm
vm:
	@vagrant box add archsible.box --name archsible
	@vagrant up

.PHONY: clean
clean:
	@vagrant destroy
	@vagrant box remove archsible || true
	@mkdir archives || true
	@echo 'Timestamping box...'
	@mv boxes/archsible.box boxes/archsible_$$(date +%Y%m%d%H%M).box
