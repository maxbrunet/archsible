SHELL := /usr/bin/env bash
PROVIDER := virtualbox

all: boxes/archsible_$(PROVIDER).box

boxes/archsible_libvirt.box:
	@packer build -on-error=ask -only=archsible.qemu.default packer/

boxes/archsible_virtualbox.box:
	@packer build -on-error=ask -only=archsible.virtualbox-iso.default packer/

.PHONY: up
up: boxes/archsible_$(PROVIDER).box
	VAGRANT_EXPERIMENTAL='typed_triggers' vagrant up --provider=$(PROVIDER)

.PHONY: clean
clean:
	@vagrant destroy
	@vagrant box remove archsible --provider=libvirt || true
	@vagrant box remove archsible --provider=virtualbox || true
	@echo 'Timestamping boxes...'
	@mv boxes/archsible_libvirt.box boxes/archsible_libvirt_$$(date +%Y%m%d%H%M).box 2>/dev/null || true
	@mv boxes/archsible_virtualbox.box boxes/archsible_virtualbox_$$(date +%Y%m%d%H%M).box 2>/dev/null || true
