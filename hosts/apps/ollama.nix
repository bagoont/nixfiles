{pkgs, ...}: {
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    acceleration = "rocm";
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx1032";
    };
    rocmOverrideGfx = "10.3.0";
  };
}
