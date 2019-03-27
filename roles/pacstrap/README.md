# pacstrap

Install base packages with [`pacstrap`](https://git.archlinux.org/arch-install-scripts.git/tree/pacstrap.in).

## Requirements

None

## Role Variables

| Name                | Default                  | Description                          |
| ------------------- | ------------------------ | ------------------------------------ |
| `pacstrap_root`     | `/mnt`                   | Mountpoint of the new root directory |
| `pacstrap_packages` | `["base", "base-devel"]` | List of base packages to install     |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: pacstrap
```

## Author Information

Maxime Brunet (@maxbrunet)
