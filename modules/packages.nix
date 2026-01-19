{
  pkgs,
  ...
}:
{
  programs = {
    firefox.enable = false; # Firefox is not installed by default
    dconf.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    monaspace
    fira-code
    fira-code-symbols
  ];

  environment.systemPackages = with pkgs; [
    docker-compose
    btop
    killall
    libnotify
    lshw
    nwg-displays # configure monitor configs via GUI
    onefetch # provides zsaneyos build info on current system
    pciutils # Collection Of Tools For Inspecting PCI Devices
    picard # For Changing Music Metadata & Getting Cover Art
    playerctl # Allows Changing Media Volume Through Scripts
    socat # Needed For Screenshots
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    usbutils # Good Tools For USB Devices
    wget # Tool For Fetching Files With Links
    ytmdl # Tool For Downloading Audio From YouTube
    obsidian # Note taking application
    bruno # Testing HTTP API
    google-chrome # Browser
  ];
}
