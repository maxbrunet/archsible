# btrfs

Manage BTFS volumes.

## Requirements

None

## Role Variables

| Name                  | Default                       | Description                                                 |
| --------------------- | ----------------------------- | ----------------------------------------------------------- |
| `btrfs_volumes`       | `Map<Map<default,subvolumes>` | List of volumes with their subvolumes and default subvolume |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: btrfs
```

## Author Information

Maxime Brunet (@maxbrunet)
