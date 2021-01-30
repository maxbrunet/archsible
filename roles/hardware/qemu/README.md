# Hardware - QEMU

Install and enable services for QEMU guest hardware.

## Requirements

* [QEMU](https://www.qemu.org)

## Role Variables

None

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: hardware/qemu
```

## Author Information

Maxime Brunet (@maxbrunet)
