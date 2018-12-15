# partition

Partition a device and mount the partitions.

## Requirements

None

## Role Variables

| Name                  | Default    | Description                         |
| --------------------- | ---------- | ----------------------------------- |
| `partition_device`    | `/dev/sda` | Device to partition and use as root |
| `partiton_mountpoint` | `/mnt`     | Root mountpoint                     |
| `partition_reset`     | `false`    | Wipe existing partition             |
| `partition_label`     | `gpt`      | Partition table type                |
| `partition_list`      | `Map<device, number, flags, part_start, part_end, mountpoint, fstype, opts>` | Map of partitions |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: partition 
```

## Author Information

Maxime Brunet (@maxbrunet)
