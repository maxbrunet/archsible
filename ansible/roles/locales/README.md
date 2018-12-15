# Locales

Configure locale settings

## Requirements

None

## Role Variables

| Name               | Default       | Description |
| ------------------ | ------------- | ----------- |
| `locales_hostname` | `archsible`   | Hostname    |
| `locales_timezone` | `UTC`         | Timezone    |
| `locales_keymap`   | `us`          | Keymap      |
| `locales_language` | `en_US.UTF-8` | Language    | 

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: locales
```

## Author Information

Maxime Brunet (@maxbrunet)
