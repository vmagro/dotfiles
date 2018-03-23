function fish_mode_prompt --description 'Write vim mode'
  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
          set_color --bold red
          echo N
      case insert
          set_color --bold green;
          echo I
      case replace_one
          set_color --bold green
          printf R
      case visual
          set_color --bold brmagenta
          printf V
    end
    set_color normal
    printf " "
  end
end

