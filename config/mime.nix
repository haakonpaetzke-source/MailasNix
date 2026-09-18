{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    imv
    gimp
    krita
    inkscape

    libreoffice-qt-stable

    zathura

    mpv

    file-roller
  ];

 xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # 🌐 Browser
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
      "application/x-extension-htm" = [ "zen-beta.desktop" ];
      "application/x-extension-html" = [ "zen-beta.desktop" ];
      "application/x-extension-shtml" = [ "zen-beta.desktop" ];
      "application/xhtml+xml" = [ "zen-beta.desktop" ];
      "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
      "application/x-extension-xht" = [ "zen-beta.desktop" ];

      # 📝 LibreOffice Writer
      "application/vnd.oasis.opendocument.text" = [
        "libreoffice-writer.desktop"
      ];
      "application/msword" = [
        "libreoffice-writer.desktop"
      ];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [
        "libreoffice-writer.desktop"
      ];

      # 📊 LibreOffice Calc
      "application/vnd.oasis.opendocument.spreadsheet" = [
        "libreoffice-calc.desktop"
      ];
      "application/vnd.ms-excel" = [
        "libreoffice-calc.desktop"
      ];
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [
        "libreoffice-calc.desktop"
      ];

      # 📽️ LibreOffice Impress
      "application/vnd.oasis.opendocument.presentation" = [
        "libreoffice-impress.desktop"
      ];
      "application/vnd.ms-powerpoint" = [
        "libreoffice-impress.desktop"
      ];
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [
        "libreoffice-impress.desktop"
      ];

      # 🖼️ Bilder
      "image/jpeg" = [ "imv.desktop" ];
      "image/png" = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];

      # 🎨 Bildbearbeitung
      "image/x-xcf" = [ "gimp.desktop" ];
      "application/x-krita" = [ "krita.desktop" ];
      "image/svg+xml" = [ "inkscape.desktop" ];

      # 📕 PDF
      "application/pdf" = [ "zathura.desktop" ];

      # 🎬 Video
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];

      # 🎵 Audio
      "audio/mpeg" = [ "mpv.desktop" ];
      "audio/flac" = [ "mpv.desktop" ];
      "audio/ogg" = [ "mpv.desktop" ];
    };

    associations.added = {
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
      "application/x-extension-htm" = [ "zen-beta.desktop" ];
      "application/x-extension-html" = [ "zen-beta.desktop" ];
      "application/x-extension-shtml" = [ "zen-beta.desktop" ];
      "application/xhtml+xml" = [ "zen-beta.desktop" ];
      "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
      "application/x-extension-xht" = [ "zen-beta.desktop" ];
    };
  };

  xdg.desktopEntries = {

    imv = {
      name = "imv";
      genericName = "Image Viewer";
      exec = "${pkgs.imv}/bin/imv %F";
      terminal = false;
      mimeType = [
        "image/jpeg"
        "image/png"
        "image/webp"
        "image/gif"
      ];
    };

    gimp = {
      name = "GIMP";
      genericName = "Image Editor";
      exec = "${pkgs.gimp}/bin/gimp %F";
      terminal = false;
      mimeType = [
        "image/x-xcf"
      ];
    };

    krita = {
      name = "Krita";
      genericName = "Digital Painting";
      exec = "${pkgs.krita}/bin/krita %F";
      terminal = false;
      mimeType = [
        "application/x-krita"
      ];
    };

    inkscape = {
      name = "Inkscape";
      genericName = "Vector Graphics Editor";
      exec = "${pkgs.inkscape}/bin/inkscape %F";
      terminal = false;
      mimeType = [
        "image/svg+xml"
      ];
    };

    zathura = {
      name = "Zathura";
      genericName = "PDF Reader";
      exec = "${pkgs.zathura}/bin/zathura %F";
      terminal = false;
      mimeType = [
        "application/pdf"
      ];
    };

    mpv = {
      name = "mpv";
      genericName = "Media Player";
      exec = "${pkgs.mpv}/bin/mpv %F";
      terminal = false;
      mimeType = [
        "video/mp4"
        "video/x-matroska"
        "video/webm"
        "audio/mpeg"
        "audio/flac"
        "audio/ogg"
      ];
    };

    "libreoffice-writer" = {
      name = "LibreOffice Writer";
      genericName = "Word Processor";
      exec = "${pkgs.libreoffice}/bin/libreoffice --writer %F";
      terminal = false;
      mimeType = [
        "application/vnd.oasis.opendocument.text"
        "application/msword"
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      ];
    };

    "libreoffice-calc" = {
      name = "LibreOffice Calc";
      genericName = "Spreadsheet";
      exec = "${pkgs.libreoffice}/bin/libreoffice --calc %F";
      terminal = false;
      mimeType = [
        "application/vnd.oasis.opendocument.spreadsheet"
        "application/vnd.ms-excel"
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      ];
    };

    "libreoffice-impress" = {
      name = "LibreOffice Impress";
      genericName = "Presentation";
      exec = "${pkgs.libreoffice}/bin/libreoffice --impress %F";
      terminal = false;
      mimeType = [
        "application/vnd.oasis.opendocument.presentation"
        "application/vnd.ms-powerpoint"
        "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      ];
    };

    "file-roller" = {
      name = "File Roller";
      genericName = "Archive Manager";
      exec = "${pkgs.file-roller}/bin/file-roller %F";
      terminal = false;
      mimeType = [
        "application/zip"
        "application/x-7z-compressed"
        "application/x-tar"
        "application/gzip"
      ];
    };
  };
}
