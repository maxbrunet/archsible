# LUKS

Manage LUKS volumes.

## Requirements

None

## Role Variables

| Name          | Default       | Description         |
| ------------- | ------------- | ------------------- |
| `lvm_volumes` | `List<Map<>>` | List of LUKS volume |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: luks
```

## Author Information

Maxime Brunet (@maxbrunet)
