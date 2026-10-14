{lib, ...}: {
  networking = {
    hostName = "homelab";
    firewall.enable = true;
    useDHCP = lib.mkDefault true;
    interfaces.ens19.ipv4.addresses = [
      {
        address = "10.0.8.2";
        prefixLength = 24;
      }
    ];
  };
}
