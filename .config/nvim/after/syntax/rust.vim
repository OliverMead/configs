" Change rust.vim's syntax spec to allow comment-block-folding (only adds
" `fold` to the relevant lines pulled from the plugin's `syntax/rust.vim`
" file)
syn region rustCommentBlock             matchgroup=rustCommentBlock         start="/\*\%(!\|\*[*/]\@!\)\@!" end="\*/" contains=rustTodo,rustCommentBlockNest,@Spell
  \ fold
syn region rustCommentBlockDoc          matchgroup=rustCommentBlockDoc      start="/\*\%(!\|\*[*/]\@!\)"    end="\*/" contains=rustTodo,rustCommentBlockDocNest,rustCommentBlockDocRustCode,@Spell
  \ fold

" Change rust.vim's syntax spec to extend line comment regions to include subsequent
" line comments (changes the `end` regex to extend the region as long as the following
" line isn't headed by another comment line of the same kind [either normal or
" doc-comment]).
syn region rustCommentLine
  \ start="//"
  \ end="^\(\(\s*//\(//\@!\)\@!\)\@!\)"
  \ contains=rustTodo,@Spell
  \ fold
syn region rustCommentLineDoc
  \ start="//\%(//\@!\|!\)"
  \ end="^\(\s*//\%(//\@!\|!\)\)\@!"
  \ contains=rustTodo,@Spell
  \ fold
