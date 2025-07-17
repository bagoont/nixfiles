{pkgs, ...}: {
  #services.open-webui = {
  #  enable = true;
  #  port = 18080;
  #  environment = {
  #    ANONYMIZED_TELEMETRY = "False";
  #    DO_NOT_TRACK = "True";
  #    SCARF_NO_ANALYTICS = "True";
  #    WEBUI_AUTH = "False";
  # };
  #};

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    acceleration = "rocm";
  };
}
