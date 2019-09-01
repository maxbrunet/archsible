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
      "pacman -Sy --noconfirm git python-pip python-wheel",
      "pip install -r \"http://$${PACKER_HTTP_ADDR}/requirements.txt\"",
      format("mkdir -p '%s'", var.ansible_staging_directory)
    ]
  }

  provisioner "file" {
    destination = var.ansible_staging_directory
    source      = "${path.root}/../ansible.cfg"
  }

  # The `galaxy_file` parameter runs the `ansible-galaxy` command
  # with `-p` which skips the installation of collections
  provisioner "file" {
    destination = var.ansible_staging_directory
    source      = "${path.root}/../requirements.yml"
  }

  provisioner "file" {
    destination = var.ansible_staging_directory
    source      = "${path.root}/../archsible.yml"
  }

  provisioner "file" {
    destination = var.ansible_staging_directory
    source      = "${path.root}/../roles"
  }

  provisioner "shell" {
    inline = [
      format("cd '%s'", var.ansible_staging_directory),
      "ansible-galaxy install -r requirements.yml",
    ]
  }

  provisioner "ansible-local" {
    extra_arguments = [
      "--diff",
      "--extra-vars",
      format("country=%s", var.country),
      "--extra-vars",
      format("user_password='%s'", var.user_password),
      "-vvv",
    ]
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
