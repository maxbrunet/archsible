# Users

Manage users.

## Requirements

None

## Role Variables

| Name                | Default      | Description                        |
| ------------------- | ------------ | ---------------------------------- |
| `users`             | `List<Map<>` | List of users                      |
' `user_applications` | `[]`         | List of user applications/packages |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: users
```

## Author Information

Maxime Brunet (@maxbrunet)
