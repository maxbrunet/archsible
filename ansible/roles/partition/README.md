# partition

Partition a storage device.

## Requirements

None

## Role Variables

| Name                  | Default    | Description                         |
| --------------------- | ---------- | ----------------------------------- |
| `partition_device`    | `/dev/sda` | Device to partition and use as root |
| `partition_reset`     | `false`    | Wipe existing partition             |
| `partition_label`     | `gpt`      | Partition table type                |
| `partition_list`      | `Map<device, number, flags, part_start, part_end, fstype>` | Map of partitions |

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
