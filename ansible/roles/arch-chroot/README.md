# arch-chroot

Reproduce the behavior of the [`arch-root` script](https://wiki.archlinux.org/index.php/Change_root#Using_arch-chroot) for Ansible by mounting the api filesystems and making `/etc/resolv.conf` available from the chroot. 

## Requirements

None

## Role Variables

| Name         | Default | Description                          |
| ------------ | ------- | ------------------------------------ |
| `chroot_dir` | `/mnt`  | Mountpoint of the new root directory |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: arch-chroot
      chroot_dir: /path/to/new/root
```

## Author Information

Maxime Brunet (@maxbrunet)
