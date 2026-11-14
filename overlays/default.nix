{inputs, ...}: {
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = _final: prev: {
    # Remove once nixpkgs includes pi-schema in Pi's runtime workspace dependencies.
    pi-coding-agent = prev.pi-coding-agent.overrideAttrs (old: {
      postInstall =
        (old.postInstall or "")
        + ''
          cp -r packages/schema "$out/lib/node_modules/pi-monorepo/node_modules/@earendil-works/pi-schema"
        '';
    });
  };

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      localSystem.system = final.system;
      config.allowUnfree = true;
    };
  };
}
