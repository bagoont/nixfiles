{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    validateSopsFiles = true;
    age.sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
  };
}
