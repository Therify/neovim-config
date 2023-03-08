call plug#begin()

Plug 'tpope/vim-surround'
Plug 'chrisbra/improvedft'
Plug 'ggandor/lightspeed.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


call plug#end()


let mapleader = " "

map <leader>s <Plug>Lightspeed_omni_s

lua require'lightspeed'.opts.ignore_case = true
lua require'lightspeed'.opts.jump_to_unique_chars = false
lua require'lightspeed'.opts.safe_labels = {}

:set ignorecase
:set autoindent

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" " Remap HJKL for bigger jumps
map H 20h
map J 10j
map K 10k
map L 20l

" NERDTree settings
nnoremap <C-n> :NERDTreeToggle<CR>

" fzf settings
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" don't consider filename as match
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" non-vscode settings
if exists('g:vscode')
    " VSCode only settings
else
    " ordinary Neovim settings
	:set number relativenumber
	colorscheme kanagawa
endif
