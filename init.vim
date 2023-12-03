" lua require('colorbuddy').colorscheme('gruvbuddy')
set listchars=tab:\ ,extends:›,precedes:‹,nbsp:·,trail:·
map <leader>gf <C-w>gf
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}

source ~/.config/nvim/configs/packer.lua
source ~/.config/nvim/configs/plugins.lua
source ~/.config/nvim/configs/basic.vim
source ~/.config/nvim/configs/custom.vim
source ~/.config/nvim/configs/filetype.vim
source ~/.config/nvim/configs/plugins_config.vim
source ~/.config/nvim/configs/extended.vim
source ~/.config/nvim/configs/lspconfig.lua

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! link CmpItemKindInterface CmpItemKindVariable
highlight! link CmpItemKindText CmpItemKindVariable
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! link CmpItemKindMethod CmpItemKindFunction
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! link CmpItemKindProperty CmpItemKindKeyword
highlight! link CmpItemKindUnit CmpItemKindKeyword


" Trouble nvim
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xr <cmd>TroubleRefresh<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \    '-shell-escape',
    \    '-verbose',
    \    '-file-line-error',
    \    '-synctex=1',
    \    '-interaction=nonstopmode',
    \ ],
    \}

