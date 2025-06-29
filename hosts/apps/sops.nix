{inputs, ...}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    validateSopsFiles = true;
    gnupg = {
      sshKeyPaths = [];
    };
    age = {
      sshKeyPaths = [];
      generateKey = true;
      keyFile = "/var/lib/sops-nix/keys.txt";
    };
  };
}
