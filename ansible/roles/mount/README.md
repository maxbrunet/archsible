# Mount

Mount file-systems and update `/etc/fstab` accordingly.

## Requirements

None

## Role Variables

| Name                  | Default    | Description                         |
| --------------------- | ---------- | ----------------------------------- |
| `mount_device`        | `/dev/sda` | Device to partition and use as root |
| `mount_mountpoint`    | `/mnt`     | Root mountpoint                     |
| `mount_list`          | `Map<device, number, mountpoint, fstype, opts>` | Map of partitions |

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
