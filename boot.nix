{ config, pkgs, ... }:
{
  # Bootloader.
  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    device = "nodev";
    efiSupport = true;
  }; 
  #boot.loader.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}