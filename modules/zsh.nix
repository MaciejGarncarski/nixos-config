{ pkgs, ... }:
{
  # System-level zsh setup
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    mise
  ];
}
