# partition

Partition a storage device.

## Requirements

None

## Role Variables

| Name                | Default       | Description                                 |
| ------------------- | ------------- | ------------------------------------------- |
| `partition_volumes` | `List<Map<>>` | List of volumes and their partition details |

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
