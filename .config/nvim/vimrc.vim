set scrolloff=8
set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set cursorline
set nofixendofline

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-tree/nvim-web-devicons' 
Plug 'nvim-tree/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'stevearc/conform.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mustache/vim-mustache-handlebars'
call plug#end()

set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme vscode 

"set background=dark " or light if you want light mode
"colorscheme gruvbox

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/vimrc.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>pb :Buffers<CR>
nnoremap <C-j> :cprev<CR>
nnoremap <C-k> :cnext<CR>
nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <leader>two :split<CR><C-w>j:term<CR><C-w>10_
nnoremap <leader>twc <C-w>l<C-w>j<C-w>j:q<CR>
vnoremap <leader>y "+y
nnoremap <leader>y "+y

"LSP shortcuts
"Go to references (C-] works by default to jump to definition)
nnoremap <C-[> :lua vim.lsp.buf.references()<CR>
nnoremap <C-a> :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>d :lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"To simulate |i_CTRL-R| in terminal-mode: >vim
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"To use `ALT+{h,j,k,l}` to navigate windows from any mode: >vim
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

