{ pkgs, inputs }:

pkgs.runCommand "miku-cursor-theme" {
  nativeBuildInputs = [ pkgs.win2xcur ];
  src = inputs.miku-cursors;
} ''
  mkdir -p $out/share/icons/miku/cursors
  win2xcur -o $out/share/icons/miku/cursors $src/*.ani $src/*.cur

  cd $out/share/icons/miku/cursors

  link() {
    [ -f "$1" ]       && ln -sf "$1" "$2"
    [ -f "$1.xcur" ]  && ln -sf "$1.xcur" "$2"
  }

  link normal                left_ptr
  link help                  question_arrow
  link working_in_background left_ptr_watch
  link busy                  watch
  link precision             crosshair
  link text                  xterm
  link handwriting           pencil
  link unavailable           crossed_circle
  link vertical              sb_v_double_arrow
  link horizontal            sb_h_double_arrow
  link diagonal_resize_1     size_fdiag
  link diagonal_resize_2     size_bdiag
  link move                  fleur
  link alternate             center_ptr
  link link                  hand2

  cat > $out/share/icons/miku/index.theme <<EOF
  [Icon Theme]
  Name=miku
  Inherits=hicolor
  EOF
''
