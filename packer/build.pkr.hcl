build {
  name = "archsible"

  sources = [
    "source.qemu.default",
    "source.virtualbox-iso.default",
  ]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -E -S -H sh '{{ .Path }}'"
    inline = [
      "echo 'Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist",
      "pacman -Sy --noconfirm git python-pip",
      "pip install -r \"http://$${PACKER_HTTP_ADDR}/requirements.txt\"",
      "curl -sSf \"$${PACKER_HTTP_ADDR}/poweroff.timer\" -o /etc/systemd/system/poweroff.timer",
      format("mkdir -p '%s'", var.ansible_staging_directory)
    ]
  }

  provisioner "file" {
    destination = var.ansible_staging_directory
    source      = "${path.root}/../ansible.cfg"
  }

  provisioner "file" {
    destination = var.ansible_staging_directory
    source      = "${path.root}/../archsible.yml"
  }

  provisioner "file" {
    destination = var.ansible_staging_directory
    source      = "${path.root}/../roles"
  }

  provisioner "ansible-local" {
    extra_arguments = [
      "--diff",
      "--extra-vars",
      format("country=%s", var.country),
      "-vvv"
    ]
    galaxy_file       = "${path.root}/../requirements.yml"
    group_vars        = "${path.root}/../group_vars"
    host_vars         = "${path.root}/../host_vars"
    inventory_file    = format("${path.root}/../inventories/packer-%s.yaml", source.type)
    playbook_file     = "${path.root}/../bootstrap.yml"
    staging_directory = var.ansible_staging_directory
  }

  post-processor "vagrant" {
    output = "${path.root}/../boxes/archsible_{{ .Provider }}.box"
  }
}
