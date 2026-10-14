{
  config,
  pkgs,
  lib,
  ...
}: {
  sops.secrets."homelab/newt/secret" = {sopsFile = ../../../secrets/homelab.yaml;};

  systemd.services.newt = {
    description = "Newt";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];
    script = ''
      exec ${lib.getExe pkgs.fosrl-newt} \
        --id ontm6zhs0zvqr2s \
        --secret "$(cat ${config.sops.secrets."homelab/newt/secret".path})" \
        --endpoint https://pangolin.bagoont.ru
    '';
    serviceConfig = {
      StateDirectory = "newt";
      Restart = "always";
      User = "root";
      ProtectSystem = "strict";
      PrivateTmp = true;
    };
  };
}
