{ lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;

    shellAliases = {
      ls = "eza";
      cat = "bat";
      lg = "lazygit";

      # Git
      gdc = "git diff --cached";
      glog = "git log --oneline";
      gs = "git status";
      gadd = "git add .";

      pi = "pnpm install";
      padd = "pnpm add";

      # Docker
      doco = "docker compose";
    };
  };

  environment.systemPackages = [
    pkgs.zsh-powerlevel10k
  ];
}