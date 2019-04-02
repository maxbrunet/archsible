# Bootloader - GRUB

Install `GRUB` and create a minimal configuration to use it for UEFI boot.

## Requirements

None

## Role Variables

| Name                 | Default               | Description             |
| -------------------- | --------------------- | ----------------------- |
| `grub_target`        | `x86_64-efi`          | Target architecture     |
| `grub_efi_directory` | `/boot/efi`           | Path to `esp`           |
| `grub_bootloader_id` | `GRUB`                | Bootloader ID           |
| `grub_config_path`   | `/boot/grub/grub.cfg` | GRUB configuration path |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: bootloader/grub
```

## Author Information

Maxime Brunet (@maxbrunet)
