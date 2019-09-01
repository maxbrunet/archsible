# Ansidot

A wrapper around Ansidot to install Git repositories of dotfiles (managed by Ansidot) and the required system packages.

## Requirements

None

## Role Variables

| Name                  | Default      | Description                                 |
| --------------------- | ------------ | ------------------------------------------- |
| `ansidot_repos`       | `List<Map<>` | List of Ansidot-compatible Git repositories |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: ansidot
```

## Author Information

Maxime Brunet (@maxbrunet)
