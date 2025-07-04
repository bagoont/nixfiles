{
  config,
  lib,
  ...
}: {
  sops = {
    secrets = {
      "wireguard/manul/private-key" = {};
      "wireguard/manul/preshared-key" = {};
    };
  };

  networking = {
    hostName = "manul";
    # enableIPv6 = true;
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    nat = {
      enable = true;
      # enableIPv6 = true;
      externalInterface = "wlp2s0";
      internalInterfaces = ["wg0"];
    };
    wg-quick.interfaces = {
      wg0 = {
        address = ["10.0.0.5/32" "fdb6:8226:fba6::5/128"];
        privateKeyFile = config.sops.secrets."wireguard/manul/private-key".path;
        peers = [
          {
            publicKey = "1+iPtqOMY44H3c3ftYqhUeHTANQSEU0AW2EI4lzDoR4=";
            presharedKeyFile = config.sops.secrets."wireguard/manul/preshared-key".path;
            endpoint = "45.91.238.71:63177";
            allowedIPs = ["10.0.0.0/24" "fdb6:8226:fba6::/64"];
          }
        ];
      };
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;
  systemd.services.systemd-networkd-wait-online.enable = false;
}
