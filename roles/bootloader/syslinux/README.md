# Bootloader - Syslinux

Install Syslinux and make minimal configuration changes to use it for BIOS/Legacy boot.

## Requirements

None

## Role Variables

| Name                  | Default                | Description              |
| --------------------- | ---------------------- | ------------------------ |
| `syslinux_root`       | `{{ _syslinux_uuid }}` | LABEL or UUID of the root device. The default guesses the UUID of the device used as root mount (`syslinux_root_mount`) |
| `syslinux_root_mount` | `/`                    | Root device mountpoint   |
| `syslinux_timeout`    | `10`                   | Timeout before auto boot |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: bootloader/syslinux
```

## Author Information

Maxime Brunet (@maxbrunet)
