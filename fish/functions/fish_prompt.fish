function fish_prompt --description 'Write out the prompt'
	# Save our status
  set -l last_status $status

  set -l last_status_string ""
  if [ $last_status -ne 0 ]
      printf "%s(%d)%s " (set_color red --bold) $last_status (set_color normal)
  end

  set -l color_cwd
  set -l suffix
  switch $USER
      case root toor
          if set -q fish_color_cwd_root
              set color_cwd $fish_color_cwd_root
          else
              set color_cwd $fish_color_cwd
          end
          set suffix '#'
      case '*'
          set color_cwd $fish_color_cwd
          set suffix '›'
  end

  echo -n -s (set_color $color_cwd) (prompt_pwd) " " (set_color normal)

  __informative_git_prompt

  echo -n (set_color green --bold) $suffix (set_color normal)
end
