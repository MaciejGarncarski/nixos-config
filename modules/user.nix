{ pkgs, username, ... }:
{

  users.users.maciek = {
    isNormalUser = true;
    description = "maciek";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  users.defaultUserShell = pkgs.zsh;
}
