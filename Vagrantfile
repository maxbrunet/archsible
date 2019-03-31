Vagrant.configure("2") do |config|
  config.vm.box = "archsible"
  config.vm.box_url = "boxes/archsible.box"
  # This trigger requires an experimental feature to be enable.
  # To do so, `vagrant up` needs to be run with following environment variable
  # VAGRANT_EXPERIMENTAL="typed_triggers"
  # See: https://www.vagrantup.com/docs/triggers/configuration.html#trigger-types
  config.trigger.after :"VagrantPlugins::ProviderVirtualBox::Action::Boot", type: :action do |trigger|
    trigger.name = "Type LUKS passphrase"
    trigger.info = "Waiting 5 seconds for GRUB to load..."
    trigger.ruby do |env,machine|
      sleep(5)
      system("VBoxManage controlvm #{machine.id} keyboardputstring 'vagrant\n'")
    end
  end
end
