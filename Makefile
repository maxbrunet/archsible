SHELL := /usr/bin/env bash
BUILDER := virtualbox-iso
PROVIDER := virtualbox

all: boxes/archsible_$(PROVIDER).box

boxes/%_libvirt.box: packer/%.yaml
	@packer build -on-error=ask -only=qemu <(scripts/yaml2json.rb < $<)

boxes/%_virtualbox.box: packer/%.yaml
	@packer build -on-error=ask -only=virtualbox-iso <(scripts/yaml2json.rb < $<)

up: boxes/archsible_$(PROVIDER).box
	VAGRANT_EXPERIMENTAL='typed_triggers' vagrant up --provider=$(PROVIDER)

.PHONY: clean
clean:
	@vagrant destroy
	@vagrant box remove archsible || true
	@echo 'Timestamping box...'
	@mv boxes/archsible_libvirt.box boxes/archsible_libvirt_$$(date +%Y%m%d%H%M).box 2>/dev/null || true
	@mv boxes/archsible_virtualbox.box boxes/archsible_virtualbox_$$(date +%Y%m%d%H%M).box 2>/dev/null || true
