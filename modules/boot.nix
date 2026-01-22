{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib)
    mkIf
    mkMerge
    mkOption
    types
    ;
  bootLoader = config.custom.bootLoader;
in
{
  options.custom.bootLoader = mkOption {
    type = types.enum [
      "systemd-boot"
      "grub"
    ];
    default = "systemd-boot";
    description = "Select which boot loader to use (systemd-boot or grub).";
  };

  config = {
    # Common boot settings
    boot.initrd.compressor = "zstd";
    boot.kernelPackages = pkgs.linuxPackages_zen;

    # Choose boot loader based on custom.bootLoader
    boot.loader = mkMerge [
      { timeout = 25; }

      (mkIf (bootLoader == "systemd-boot") {
        systemd-boot.enable = true;
        systemd-boot.configurationLimit = 3;
        efi.canTouchEfiVariables = true;
      })

      (mkIf (bootLoader == "grub") {
        grub = {
          enable = true;
          version = 2;
          efiSupport = true;
          device = "nodev";
        };
      })
    ];
  };
}
