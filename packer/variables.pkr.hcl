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
  default     = "file:https://mirrors.kernel.org/archlinux/iso/2021.08.01/sha1sums.txt"
}

variable "iso_url" {
  type        = string
  description = "A URL to the ISO containing the installation image."
  default     = "https://mirrors.kernel.org/archlinux/iso/2021.08.01/archlinux-2021.08.01-x86_64.iso"
}

variable "ovmf_path" {
  type        = string
  description = "Path to OVMF binary, the sample UEFI firmware for QEMU and KVM."
  default     = "/usr/share/qemu/ovmf-x86_64.bin"
}

variable "user_password" {
  type        = string
  description = "Crypted user's password."
  # Crypted password generated with:
  # python -c 'import crypt; print(crypt.crypt("vagrant", crypt.mksalt(crypt.METHOD_SHA512)))'
  default = "$6$RF9eiikaPEUeBlOs$i7TbeuKSXT4wUiwn1MVrSSspWmWpeGC/FMOSz0od1Llhf3squIQxElpT.gO3VkgVTH4Czefb1ClJqXCsWM2Sa/"
}
