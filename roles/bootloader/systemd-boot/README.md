# Bootloader - systemd-boot

Install `systemd-boot` and create a minimal configuration to use it for UEFI boot.

## Requirements

None

## Role Variables

| Name                  | Default                                           | Description                              |
| --------------------- | ------------------------------------------------- | ---------------------------------------- |
| `systemd_boot_esp`    | `/boot`                                           | ESP mountpoint used to copy the EFI boot loader |
| `systemd_boot_entry`  | `{{ systemd_boot_esp }}/loader/entries/arch.conf` | Path to default boot entry file          |
| `systemd_boot_root`   | `PARTLABEL=System`                                | Root partition identifier.               |
| `systemd_boot_fstype` | `ext4`                                            | Filesystem of the root partition.        |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: bootloader/systemd-boot
```

## Author Information

Maxime Brunet (@maxbrunet)
