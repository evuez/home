set -gx TERM xterm-256color
function fish_vi_cursor; end
fish_vi_key_bindings

function fish_user_key_bindings
  bind yy fish_clipboard_copy
  bind Y fish_clipboard_copy
  bind p fish_clipboard_paste
end

set BC_ENV_ARGS "$HOME/.bc"

set PATH "$HOME/.cargo/bin" $PATH
source ~/.asdf/asdf.fish

# Dracula theme

set -x COMMENT 6272a4
set -x CYAN 8be9fd
set -x GREEN 50fa7b
set -x ORANGE ffb86c
set -x PINK ff79c6
set -x PURPLE bd93f9
set -x RED ff5555
set -x YELLOW f1fa8c

set fish_color_autosuggestion $COMMENT
set fish_color_command $PINK
set fish_color_comment $COMMENT
set fish_color_cwd $CYAN
set fish_color_cwd_root $RED
set fish_color_end normal
set fish_color_error $RED
set fish_color_escape $CYAN
set fish_color_history_current $CYAN
set fish_color_host normal
set fish_color_match $GREEN
set fish_color_normal normal
set fish_color_operator $CYAN
set fish_color_param normal
set fish_color_quote $YELLOW
set fish_color_redirection $PURPLE
set fish_color_search_match \x2d\x2dbackground\x3d$PURPLE
set fish_color_selection \x2d\x2dbackground\x3d$PURPLE
set fish_color_user $PURPLE
set fish_color_valid_path \x2d\x2dunderline
