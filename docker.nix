{
  config,
  lib,
  username,
  ...
}:
{
  # Docker config
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "${username}" ];
  virtualisation.docker.logDriver = "json-file";
  
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}