set -gx TERM xterm-256color
function fish_vi_cursor; end
fish_vi_key_bindings

function fish_user_key_bindings
  bind yy fish_clipboard_copy
  bind Y fish_clipboard_copy
  bind p fish_clipboard_paste
end

set BC_ENV_ARGS "$HOME/.bc"
