variable "ansible_staging_directory" {
  type        = string
  description = <<-EOT
    The directory where all the configuration of Ansible by Packer will be placed.
    Do not forget the trailing `/` slash, it is import for the `file` provisioner.
  EOT
  default     = "/tmp/packer-provisioner-ansible-local/"
}

variable "country" {
  type        = string
  description = "Arch Linux mirrors country"
  default     = "US"
}

variable "headless" {
  type        = bool
  description = "Set to `false` to launch a GUI that shows the console of the machine being built."
  default     = true
}

variable "iso_checksum" {
  type        = string
  description = "The checksum for the ISO file."
  default     = "file:https://mirrors.kernel.org/archlinux/iso/2021.02.01/sha1sums.txt"
}

variable "iso_url" {
  type        = string
  description = "A URL to the ISO containing the installation image."
  default     = "https://mirrors.kernel.org/archlinux/iso/2021.02.01/archlinux-2021.02.01-x86_64.iso"
}

variable "ovmf_path" {
  type        = string
  description = "Path to OVMF binary, the sample UEFI firmware for QEMU and KVM."
  default     = "/usr/share/qemu/ovmf-x86_64.bin"
}
