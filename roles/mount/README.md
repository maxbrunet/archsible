# Mount

Mount file-systems and update `/etc/fstab` accordingly.

## Requirements

None

## Role Variables

| Name                    | Default    | Description                             |
| ----------------------- | ---------- | --------------------------------------- |
| `mount_base_mountpoint` |            | Root mountpoint. Empty string for `/`.  |
| `mount_volumes`         | `Map<>`    | Map of mounts                           |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: mount
```

## Author Information

Maxime Brunet (@maxbrunet)
