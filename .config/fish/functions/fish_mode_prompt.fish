# The fish_mode_prompt function is prepended to the prompt
function fish_mode_prompt --description "Displays the current mode"
  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
    switch $fish_bind_mode
      case default
        set_color --bold ff005f
        echo 🅽
      case insert
        set_color --bold 3a3335
        echo 🅸
      case replace_one
        set_color --bold c6d8d3
        echo 🆁
      case visual
        set_color --bold eb5e55
        echo 🆅
    end
    set_color normal
    echo -n ' '
  end
end
