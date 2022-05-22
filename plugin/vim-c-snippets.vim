function! GetMyAuthorName()
  if exists('g:my_author_name')
    return g:my_author_name
  endif

  if executable('git') != 1
    return 'My Name'
  endif

  " get a name from 'user.name' in ~/.gitconfig
  if g:uname == 'WINDOWS'
    let grep = 'findstr'
  else
    let grep = 'grep'
  endif
  let git_user_name = system('git config -l --global | ' . grep . ' user.name')
  let git_user_name = substitute(git_user_name, "\n", "", "")
  if git_user_name != ''
    return strpart(git_user_name, match(git_user_name, '=') + 1)
  endif
endfunction
