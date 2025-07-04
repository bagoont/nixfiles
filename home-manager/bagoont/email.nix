{config, ...}: {
  services.imapnotify.enable = true;

  sops.secrets = {
    "bagoont/email/password" = {};
  };

  accounts.email.accounts.bagoont = {
    primary = true;
    userName = "bagoont@bagoont.ru";
    realName = "Vladislav Baginsky";
    address = "bagoont@bagoont.ru";
    aliases = ["blvd@bagoont.ru" "baginsky.v@bagoont.ru"];
    passwordCommand = "cat ${config.sops.secrets."bagoont/email/password".path}";
    imap = {
      host = "imap.timeweb.ru";
      port = 993;
    };
    imapnotify.enable = true;
    smtp = {
      host = "smtp.timeweb.ru";
      port = 465;
    };
    thunderbird = {
      enable = true;
    };
  };
}
