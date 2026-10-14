{inputs, ...}: {
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = _final: prev: {
    typescript-language-server = prev.typescript-language-server.overrideAttrs (old: {
      pnpmDeps = old.pnpmDeps.overrideAttrs (_: {
        outputHash = "sha256-xR/EF60lVBsITKgH7wCM2wHM46PFQevD51KfCENSUH4=";
      });
    });
  };

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      localSystem.system = final.system;
      config.allowUnfree = true;
    };
  };
}
