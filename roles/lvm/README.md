# lvm

Manage LVM volumes.

## Requirements

None

## Role Variables

| Name          | Default       | Description         |
| ------------- | ------------- | ------------------- |
| `lvm_volumes` | `List<Map<>>` | List of LVM volumes |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: lvm
```

## Author Information

Maxime Brunet (@maxbrunet)
