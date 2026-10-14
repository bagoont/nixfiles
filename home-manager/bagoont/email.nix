{
  config,
  pkgs,
  ...
}: {
  sops.secrets = {
    "email/bagoont/password" = {
      sopsFile = ../../secrets/email.yaml;
    };
  };

  accounts.email.accounts.bagoont = {
    primary = true;
    userName = "bagoont@bagoont.ru";
    realName = "Vladislav Baginsky";
    address = "bagoont@bagoont.ru";
    aliases = ["blvd@bagoont.ru" "baginsky.v@bagoont.ru"];
    passwordCommand = "cat ${config.sops.secrets."email/bagoont/password".path}";
    imap = {
      host = "mail.bagoont.ru";
      port = 993;
    };
    smtp = {
      host = "mail.bagoont.ru";
      port = 465;
    };
    gpg = {
      key = "D17AE4329F38AFA355B8C0692CEBD2E41671AFF7";
      signByDefault = true;
    };
    thunderbird = {
      enable = true;
    };
  };
}
