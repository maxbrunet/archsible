source "qemu" "default" {
  boot_command = [
    "<up><up><enter><wait10><wait10><wait10><wait10>",
    "curl -sSfO '{{ .HTTPIP }}:{{ .HTTPPort }}/enable-ssh.sh'<enter><wait>",
    "sh enable-ssh.sh<enter>",
  ]
  boot_wait = "2s"
  # Enable TRIM
  # https://www.qemu.org/docs/master/system/invocation.html#hxtool-1
  disk_detect_zeroes = "unmap"
  disk_discard       = "unmap"
  disk_interface     = "virtio-scsi"
  disk_size          = "131072M"
  headless           = var.headless
  http_directory     = "${path.root}/http"
  iso_checksum       = var.iso_checksum
  iso_url            = var.iso_url
  memory             = 1024
  qemuargs = [
    # Firmware for UEFI boot
    ["-bios", var.ovmf_path],
    # Emulate SSD (non-rotational disk) with `rotation_rate=1`
    # Overriding of `-device` param for qemu builder breaks `virtio-scsi` driver.
    # https://github.com/hashicorp/packer/issues/3348
    ["-device", "virtio-scsi-pci,id=scsi0"],
    ["-device", "scsi-hd,bus=scsi0.0,drive=drive0,rotation_rate=1"]
  ]
  shutdown_command = "poweroff"
  ssh_password     = "vagrant"
  ssh_username     = "root"
}

source "virtualbox-iso" "default" {
  boot_command = [
    "<up><up><enter><wait10><wait10><wait10><wait10><wait10><wait10><wait10>",
    "curl -sSfO '{{ .HTTPIP }}:{{ .HTTPPort }}/enable-ssh.sh'<enter><wait>",
    "sh enable-ssh.sh<enter>"
  ]
  boot_wait                = "2s"
  disk_size                = 131072
  gfx_controller           = "vmsvga"
  gfx_accelerate_3d        = true
  gfx_vram_size            = 16
  gfx_efi_resolution       = "1280x720"
  guest_additions_mode     = "disable"
  guest_os_type            = "ArchLinux_64"
  hard_drive_interface     = "sata"
  hard_drive_nonrotational = "true"
  headless                 = var.headless
  http_directory           = "${path.root}/http"
  iso_checksum             = var.iso_checksum
  iso_interface            = "sata"
  iso_url                  = var.iso_url
  memory                   = 1024
  shutdown_command         = "poweroff"
  ssh_password             = "vagrant"
  ssh_username             = "root"
  vboxmanage = [
    ["modifyvm", "{{ .Name }}", "--firmware", "efi"],
  ]
}
