SHELL := /usr/bin/env bash

all: archsible.box

%.box: packer_%.yaml
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
	@echo 'Moving box to archives...'
	@mv archsible.box archives/archsible_$$(date +%Y%m%d%H%M).box
