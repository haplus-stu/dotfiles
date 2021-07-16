	" Customize global settings
	" Use around source.
  "
	call ddc#custom#patch_global('sources', ['around'])
	" Enable default matcher.
	call ddc#custom#patch_global('sourceOptions', {
	      \ '_': {'matchers': ['matcher_head']},
	      \ })
	" Change source options
	call ddc#custom#patch_global('sourceOptions', {
	      \ 'around': {'matchers': ['matcher_head'], 'mark': 'A'},
	      \ })
	call ddc#custom#patch_global('sourceParams', {
	      \ 'around': {'maxSize': 500},
	      \ })
  call ddc#custom#patch_global('sources', ['zsh'])
  call ddc#custom#patch_global('sourceOptions', {
        \ '_': {'matchers': ['matcher_head']},
        \ 'zsh': {'mark': 'ZSH'},
        \ })
	call ddc#enable()
