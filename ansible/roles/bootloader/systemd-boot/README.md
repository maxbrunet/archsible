# Bootloader - systemd-boot

Install `systemd-boot` and create a minimal configuration to use it for UEFI boot.

## Requirements

None

## Role Variables

| Name                  | Default                                           | Description                              |
| --------------------- | ------------------------------------------------- | ---------------------------------------- |
| `systemd_boot_esp`    | `/boot`                                           | ESP mountpoint used to copy the EFI boot loader |
| `systemd_boot_entry`  | `{{ systemd_boot_esp }}/loader/entries/arch.conf` | Path to default boot entry file          |
| `systemd_boot_root`   | `PARTUUID={{ _systemd_boot_partuuid.stdout }}`    | Root partition identifier. Default: `PARTUUID` from `syslinux_root_mount` |
| `syslinux_root_mount` | `/`                                               | Mountpoint of the root partition         |
| `systemd_boot_fstype` | `{{ _systemd_boot_mount.fstype }}`                | Filesystem of the root partittion. Default guessed from `syslinux_root_mount` |

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
