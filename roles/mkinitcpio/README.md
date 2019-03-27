# mkinitcpio

Configure and run `mkinitcpio` to generate `initramfs` image.

## Requirements

None

## Role Variables

| Name                             | Default                    | Description                             |
| -------------------------------- | -------------------------- | --------------------------------------- |
| `mkinitcpio_command`             | `mkinitcpio --config {{ mkinitcpio_conf }} --preset {{ mkinitcpio_preset }}` | `mkinitcpio` command and arguments |
| `mkinitcpio_preset`              | `linux`                    | `mkinitcpio` preset to use              |
| `mkinitcpio_conf`                | `/etc/mkinitcpio.conf`     | `mkinitcpio` configuration path         |
| `mkinitcpio_image`               |`/boot/initramfs-linux.img` | `mkinitcpio` expected output image path |
| `mkinitcpio_modules`             | `''`                       | `mkinitcpio` modules                    |
| `mkinitcpio_binaries`            | `''`                       | `mkinitcpio` binaries                   |
| `mkinitcpio_files`               | `''`                       | `mkinitcpio` files                      |
| `mkinitcpio_hooks`               | `base udev autodetect modconf block filesystems keyboard fsck` | `mkinitcpio` hooks |
| `mkinitcpio_compression`         | `''`                       | `mkinitcpio` compression                |
| `mkinitcpio_compression_options` | `''`                       | `mkinitcpio` compression options        |

## Dependencies

None

## Example Playbook

```yaml
- hosts: arch
  roles:
    - role: mkinitcpio
```

## Author Information

Maxime Brunet (@maxbrunet)
