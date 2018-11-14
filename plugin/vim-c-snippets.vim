function! GetMyAuthorName()
  if exists('g:my_author_name')
    return g:my_author_name
  else
    let git_user_name = system('git config -l --global | grep user.name')
    if git_user_name != ''
      return strpart(git_user_name, match(git_user_name, '=') + 1)
    else
      return 'My Name'
    endif
  endif
endfunction
