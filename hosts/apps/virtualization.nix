{
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["bagoont"];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.users.bagoont.extraGroups = ["libvirtd"];
}
