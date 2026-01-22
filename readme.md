Use my config

# 1. Clone config repository

```bash

git clone https://github.com/MaciejGarncarski/nix-config.git ~/.nix-config

```

# 2. Generate own hardware-configuration.nix

```bash

nixos-generate-config --show-hardware-config > hardware-configuration.nix

```

# 3. Select boot loader based on your needs.

in `modules/system.nix` find `custom.bootLoader = ` and insert `systemd-boot` or `grub`.

# 4. Rebuild

```bash

chmod +x ~/.nix-config/rebuild.sh

cd ~/.nix-config && ./rebuild.sh

```
