" colorscheme gruvbox
" set background=dark
map <C-E> :e! ~/.config/nvim/init.vim<cr>
map <C-Y> :w<cr>:so ~/.config/nvim/init.vim<cr>:PackerInstall<cr>
let g:gruvbox_contrast_dark='hard'
set number
set mouse=a
" set nocp
set relativenumber
set cursorline
setlocal spell spelllang=en_us
set noshowmode
set splitbelow splitright
setlocal nospell

noremap <silent> <Left> :vertical resize +3<cr>
noremap <silent> <Right> : vertical resize -3<cr>
noremap <silent> <Up> :resize -3<cr>
noremap <silent> <Down> :resize +3<cr>

map <leader>tt :terminal<cr>
map <leader>gf <C-w>gf

augroup autoupdategrub
    autocmd!
    "Runs sudo update-grub after editing and exiting grub config
    autocmd VimLeave /etc/default/grub !sudo update-grub
augroup END

inoremap <C-V> <ESC>"+pa
vnoremap <C-C> "+y
vnoremap <C-X> "+d

" inoremap ii <ESC>

"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1


" settings for Okular
let g:tex_flavour='latex'
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_method = 'latexmk'
" let g:vimtex_compiler_pdflatex = {
"         \ 'executable' : 'pdflatex',
"         \ 'options' : [
"         \ '-synctex=1',
"         \ '-interaction=nonstopmode',
"         \ '--shell-escape'
"       \ ],
"       \ }
" let g:vimtex_compiler_latexmk = { 
"         \ 'executable' : 'latexmk',
"         \ 'options' : [ 
"         \   '-xelatex',
"         \   '-file-line-error',
"         \   '-synctex=1',
"         \   '-interaction=nonstopmode',
"       \ '--shell-escape'
"         \ ],
"         \}

" let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_options = '--unique file:@pdf\#src:@line@tex'
" nnoremap <leader>ll :Vim
let maplocalleader = " "

au FileType tex nmap j gj<silent>
au FileType tex nmap k gk<silent>
au FileType tex nmap 0 g0<silent>
au FileType tex nmap $ g$<silent>


set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


"""""" TODO INKSCAPE TODO """"""
inoremap <Esc>f <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <Esc>f : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>


function Openpy()
	let line = getline('.')	
	:silent !mkdir Practice > /dev/null 2>&1 &
	execute 'normal S\inputminted[bgcolor=bg, style=one-dark]{python}{Practice/'.line.'.py}'
	execute 'edit Practice/'.line.'.py'
endfunction

" inoremap <Esc>q <Esc>:silent exec "edit practice/".getline(".").".py"<CR>
" nnoremap <Esc>q : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
inoremap <Esc>q <Esc>:silent call Openpy()<CR>

""TODO TODO  ULTISNIPS TODO TODO""
let g:UltiSnipsSnippetDirectories=["/home/lavish/.config/nvim/ultisnips"]


" let g:UltiSnipsSnippetDirectories=["/home/lavish/.config/coc/ultisnips"]
" " Use <C-l> for trigger snippet expand.
" imap  <Plug>(coc-snippets-expand)
"
" " Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
"
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
"
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
"
" " Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
"
" " Use <leader>x for convert visual selected code to snippet
" xmap <leader>x  <Plug>(coc-convert-snippet)



" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ CheckBackSpace() ? "\<TAB>" :
"       \ coc#refresh()
"
" function! CheckBackSpace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'



