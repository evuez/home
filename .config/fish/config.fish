set -gx TERM xterm-256color

set -x VISUAL nvim
set -x EDITOR nvim
set -x BC_ENV_ARGS "$HOME/.bc"
set -x FZF_DEFAULT_COMMAND "rg --files --hidden --smart-case --glob !.git/"
set -x ERL_AFLAGS "-kernel shell_history enabled"
set PATH "$HOME/.cargo/bin" $PATH

# Vim bindings

function fish_vi_cursor; end
fish_vi_key_bindings

function fish_user_key_bindings
  bind yy fish_clipboard_copy
  bind Y fish_clipboard_copy
  bind p fish_clipboard_paste
end

# Dracula theme

set -l background 282a36
set -l foreground f8f8f2
set -l selection 44475a
set -l comment 6272a4
set -l red ff5555
set -l orange ffb86c
set -l yellow f1fa8c
set -l green 50fa7b
set -l purple bd93f9
set -l cyan 8be9fd
set -l pink ff79c6

## Syntax Highlighting Colors

set -g fish_color_background $background
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

## Completion Pager Colors

set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# Misc

source ~/.asdf/asdf.fish
