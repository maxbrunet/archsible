luks_passphrase = "vagrant"
ovmf_path = ENV["OVMF_PATH"] || "/usr/share/qemu/ovmf-x86_64.bin"

Vagrant.configure("2") do |config|
  config.vm.box = "archsible"

  # The action triggers require to enable an experimental feature.
  # To do so, `vagrant up` needs to be run with following environment variable:
  # VAGRANT_EXPERIMENTAL="typed_triggers"
  # See: https://www.vagrantup.com/docs/triggers/configuration.html#trigger-types

  config.vm.provider "libvirt" do |libvirt, override|
    override.vm.box_url = "boxes/archsible_libvirt.box"
    libvirt.loader = ovmf_path
    libvirt.channel :type => 'unix', :target_name => 'org.qemu.guest_agent.0', :target_type => 'virtio'
    # https://github.com/vagrant-libvirt/vagrant-libvirt/pull/692
    # libvirt.disk_bus = 'virtio-scsi'
    # libvirt.qemuargs :value => "-set"
    # libvirt.qemuargs :value => "device.scsi0-0-0-0.rotation_rate=1"
    # https://github.com/vagrant-libvirt/vagrant-libvirt/issues/486
    # libvirt.disk_discard = 'unmap'
    # libvirt.disk_zeroes = 'unmap'
    config.trigger.after :"VagrantPlugins::ProviderLibvirt::Action::StartDomain", type: :action do |trigger|
      trigger.name = "Type the LUKS passphrase"
      trigger.info = "Waiting 5s for boot..."
      trigger.ruby do |env,machine|
        require "pty"
        sleep(5)
        PTY.spawn("virsh console #{machine.id}") do |_, w|
          sleep(1)
          w.puts(luks_passphrase)
        end
      end
    end
    # Should happen during `vagrant box remove`
    # https://github.com/vagrant-libvirt/vagrant-libvirt/issues/85
    config.trigger.after :destroy do |trigger|
      trigger.name = "Remove Vagrant box image from libvirt volume pool"
      trigger.ruby do |env,machine|
        system("virsh vol-delete --pool default '#{config.vm.box}_vagrant_box_image_0_box.img'")
      end
    end
  end

  config.vm.provider "virtualbox" do |vbox, override|
    config.trigger.after :"VagrantPlugins::ProviderVirtualBox::Action::Boot", type: :action do |trigger|
      override.vm.box_url = "boxes/archsible_virtualbox.box"
      trigger.name = "Type the LUKS passphrase"
      trigger.info = "Waiting 5s for boot..."
      trigger.ruby do |env,machine|
        sleep(5)
        system("VBoxManage controlvm #{machine.id} keyboardputstring '#{luks_passphrase}\n'")
      end
    end
  end
end
