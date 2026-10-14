{
  lib,
  appimageTools,
  fetchurl,
}: let
  pname = "logseq-db";
  version = "2.0.2";

  src = fetchurl {
    url = "https://github.com/logseq/logseq/releases/download/nightly/Logseq-linux-x86_64-${version}.AppImage";
    hash = "sha256-FB54kD3owPCLq8D31Y/u+I0R2qgflFHK//AiAMu2DKM=";
  };

  appimageContents = appimageTools.extract {inherit pname version src;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraInstallCommands = ''
      mkdir -p $out/share/applications $out/share/icons/hicolor/512x512/apps
      install -m 444 -D ${appimageContents}/logseq.desktop -t $out/share/applications
      install -m 444 -D ${appimageContents}/logseq.png $out/share/icons/hicolor/512x512/apps/logseq.png
      substituteInPlace $out/share/applications/logseq.desktop \
        --replace-fail "Exec=AppRun %U" "Exec=${pname} %U"
    '';

    meta = with lib; {
      description = "Privacy-first, open-source platform for knowledge management and collaboration";
      homepage = "https://logseq.com";
      license = licenses.agpl3Only;
      platforms = ["x86_64-linux"];
      mainProgram = pname;
    };
  }
