# filesystems_progs

Install filesystems programs.

## Requirements

None

## Role Variables

| Name                | Default | Description                                 |
| ------------------- | ------- | ------------------------------------------- |
| `filesystems_progs` | `[]`    | List of filesystems to install programs for |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: filesystems_progs
```

## Author Information

Maxime Brunet (@maxbrunet)
