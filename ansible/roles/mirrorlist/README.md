# Mirrorlist

Generate Pacman Mirrorlist

## Requirements

None

## Role Variables

| Name                 | Default                         | Description     |
| -------------------- | ------------------------------- | --------------- |
| `mirrorlist_country` | `{{ country | default("US") }}` | Mirrors country |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
     - role: mirrorlist
```

## Author Information

Maxime Brunet (@maxbrunet)
