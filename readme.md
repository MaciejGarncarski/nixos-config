Use my config

# 1. Clone config repository

```bash

git clone https://github.com/MaciejGarncarski/nixos-config.git ~/.nixos-config

```

# 2. Generate own hardware-configuration.nix

```bash

nixos-generate-config --show-hardware-config > hardware-configuration.nix

```

# 4. Rebuild nixOS

```bash

chmod +x ~/.nixos-config/rebuild.sh

cd ~/.nixos-config && ./rebuild.sh

```
