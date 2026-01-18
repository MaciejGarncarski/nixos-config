{ config, pkgs, ... }:

{
  # Bootloader: systemd-boot (UEFI only)
  boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.timeout = 25;
  boot.initrd.compressor = "zstd";

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
