{ config, pkgs, lib, ... }:

let
  badapple = pkgs.stdenv.mkDerivation {
    pname = "bad-apple-terminal";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "panzi";
      repo = "bad-apple-terminal";
      rev = "main";

      hash = lib.fakeHash;
    };

    nativeBuildInputs = with pkgs; [
      gcc
      gnumake
      python3
      python3Packages.pillow
      ffmpeg
      yt-dlp
    ];

    buildPhase = ''
      make DEBUG=OFF
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp bad-apple-terminal $out/bin/badapple
    '';
  };
in
{
  environment.systemPackages = [
    badapple
  ];
}
