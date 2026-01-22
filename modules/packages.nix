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
    corefonts
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
    fastfetch
    unrar
    unzip
    wget
    vlc # Media player
    kdePackages.kdenlive # Video editor
    kdePackages.filelight # Disk usage analyzer
    handbrake # Video converter
    ffmpegthumbnailer # Video thumbnails in Dolphin
    ffmpeg # Video processing
    imagemagick # Image processing
    ytmdl
    onlyoffice-desktopeditors
    obsidian
    bruno
    google-chrome
    (pkgs.google-chrome.override {
      commandLineArgs = "--password-store=basic";
    })
    python3 # Required for Node.js ./configure
    gcc # Required for compiling native modules
    gnumake # Required for building
    pkg-config # Helps find libraries
  ];

  # nix-ld for unpached libraries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
    libxcrypt-legacy
  ];

  # remove unused packages
  environment.plasma6.excludePackages = with pkgs; [
    pkgs.kdePackages.konsole
    pkgs.kdePackages.elisa
  ];
}
