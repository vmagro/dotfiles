function fish_user_key_bindings --description 'custom key bindings.'
  for mode in insert default visual
    bind -M $mode \cN forward-char
  end
end

fzf_key_bindings
