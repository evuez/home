# The fish_mode_prompt function is prepended to the prompt
function fish_mode_prompt --description "Displays the current mode"
  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
    set_color --bold 282a36
    switch $fish_bind_mode
      case default
        set_color -b ff5555
        echo ' n '
      case insert
        set_color -b f8f8f2
        echo ' i '
      case replace_one
        set_color -b 8be9fd
        echo ' r '
      case visual
        set_color -b ffb86c
        echo ' v '
    end
    set_color normal
    set_color -b normal
  end
end
