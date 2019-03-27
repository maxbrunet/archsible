# lvm

Manage LVM volumes.

## Requirements

None

## Role Variables

| Name      | Default                        | Description             |
| --------- | ------------------------------ | ----------------------- |
| `lvm_vgs` | `List<Map<vg,pvs>>`            | List of volume groups   |
| `lvm_lvs` | `List<Map<lv,vg,size,fstype>>` | List of logical volumes |

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
