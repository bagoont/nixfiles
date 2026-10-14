{lib, ...}: {
  networking = {
    hostName = "ideapad";
    firewall.enable = true;
    # enableIPv6 = true;
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
  systemd.services.systemd-networkd-wait-online.enable = false;
}
