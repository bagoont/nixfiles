{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets/secrets.yml;
    validateSopsFiles = true;
    gnupg = {
      sshKeyPaths = [];
    };
    age = {
      keyFile = "${config.home.homeDirectory}/.config/sops-nix/age/keys.txt";
      sshKeyPaths = [];
      generateKey = true;
    };
  };
}
