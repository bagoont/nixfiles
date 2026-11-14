{
  lib,
  stdenvNoCC,
  fetchurl,
  unzip,
}: let
  version = "1.3.4";
  licenseFile = fetchurl {
    url = "https://raw.githubusercontent.com/tywr/Nordwand-Mono/${version}/LICENSE-FONT.txt";
    hash = "sha256-4OST7a5xStW7JDo0bz/UXs3ZSgBYQRgpfy0F4PYYfTg=";
  };
in
  stdenvNoCC.mkDerivation {
    pname = "nordwand-mono";
    inherit version;

    src = fetchurl {
      url = "https://github.com/tywr/Nordwand-Mono/releases/download/${version}/NordwandMono-TTF.zip";
      hash = "sha256-If60DYDSQcjaTZnGHO9k++6svFlT9/LMon/xvZzVLAE=";
    };

    nativeBuildInputs = [unzip];
    sourceRoot = ".";
    dontBuild = true;

    installPhase = ''
      runHook preInstall
      install -Dm644 *.ttf -t "$out/share/fonts/truetype"
      install -Dm644 ${licenseFile} "$out/share/doc/nordwand-mono/LICENSE-FONT.txt"
      runHook postInstall
    '';

    meta = {
      description = "Compact neo-grotesk monospace font for coding";
      homepage = "https://github.com/tywr/Nordwand-Mono";
      license = lib.licenses.ofl;
      platforms = lib.platforms.all;
    };
  }
