{ pkgs, inputs }:

pkgs.runCommand "miku-cursor-theme" {
  nativeBuildInputs = [ pkgs.win2xcur ];
  src = inputs.miku-cursors;
} ''
  mkdir -p $out/share/icons/miku/cursors

  # .ani (animiert) und .cur (statisch) konvertieren
  win2xcur -o $out/share/icons/miku/cursors $src/*.ani $src/*.cur

  cd $out/share/icons/miku/cursors

  # Robuster Helfer: findet die Datei egal welche Endung win2xcur vergibt,
  # und schlägt NIE fehl (sonst bricht set -e den Build ab)
  link() {
    for f in "$1" "$1.xcur" "$1.xcursor"; do
      if [ -e "$f" ]; then
        ln -sf "$(basename "$f")" "$2"
        break
      fi
    done
    return 0
  }

  # Zuordnung exakt aus der install.inf des Packs
  # (Vocaloid Hatsune Miku Cursors by HN_niner)
  link normal                left_ptr            # Arrow
  link help                  question_arrow      # Help (animiert)
  link working_in_background left_ptr_watch      # AppStarting (animiert)
  link busy                  watch               # Wait (animiert)
  link precision             crosshair           # Crosshair (animiert)
  link text                  xterm               # Text (animiert)
  link handwriting           pencil              # Handwriting
  link unavailable           crossed_circle      # No
  link vertical              sb_v_double_arrow   # SizeNS
  link horizontal            sb_h_double_arrow   # SizeWE
  link diagonal_resize_1     size_fdiag          # SizeNWSE
  link diagonal_resize_2     size_bdiag          # SizeNESW
  link move                  fleur               # SizeAll
  link alternate             center_ptr          # UpArrow
  link link                  hand2               # Link (animiert)

  cat > $out/share/icons/miku/index.theme <<EOF
  [Icon Theme]
  Name=miku
  Inherits=hicolor
  EOF
''
