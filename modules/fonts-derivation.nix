{
  lib,
  pkgs,
  ...
}:
pkgs.stdenv.mkDerivation {
  pname = "mdio-trial";
  version = "1.0";

  src = ../../assets/md-io-trial.zip;

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src
    runHook postUnpack
  '';

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;
  dontFixup = true;

  installPhase = ''
    runHook preInstall
    install -Dm644 /*.ttf -t $out/
    runHook postInstall
  '';

  meta = {
    description = "A typeface made for ";
  };
  stdenvNoCC.mkDerivation = rec {
    pname = "jetbrains-mono";
    version = "2.304";

    dontPatch = true;
    dontConfigure = true;
    dontBuild = true;
    doCheck = false;
    dontFixup = true;

    installPhase = ''
      runHook preInstall
      install -Dm644 -t $out/share/fonts/truetype/ fonts/ttf/*.ttf
      install -Dm644 -t $out/share/fonts/truetype/ fonts/variable/*.ttf
      runHook postInstall
    '';

    meta = with lib; {
      description = "A typeface made for developers";
      homepage = "https://jetbrains.com/mono/";
      changelog = "https://github.com/JetBrains/JetBrainsMono/blob/v${version}/Changelog.md";
      license = licenses.ofl;
      maintainers = with maintainers; [vinnymeller];
      platforms = platforms.all;
    };
  };
}
