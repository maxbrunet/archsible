# partition

Partition a storage device.

## Requirements

None

## Role Variables

| Name                  | Default    | Description                         |
| --------------------- | ---------- | ----------------------------------- |
| `partition_label`     | `gpt`      | Partition table type                |
| `partition_list`      | `Map<name, device, number, flags, part_start, part_end, fstype>` | Map of partitions |

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
