{ config, pkgs, lib, ... }:

let
  badapple = pkgs.stdenv.mkDerivation {
    pname = "bad-apple-terminal";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "panzi";
      repo = "bad-apple-terminal";
      rev = "main";

      hash = "sha256-RaoVOXLqDtoGOjchH87mYzD9vGDaDlOdr9+G6QPJh3I=";
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
      mkdir -p build/release
      make DEBUG=OFF
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp build/release/bad-apple-terminal $out/bin/badapple
    '';
  };
in
{
  environment.systemPackages = [
    badapple
  ];
}
