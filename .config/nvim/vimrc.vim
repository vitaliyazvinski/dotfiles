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
Plug 'wellle/context.vim'
Plug 'christoomey/vim-tmux-navigator'
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

inoremap <A-c>l <Plug>(copilot-accept-line)
inoremap <A-c>w <Plug>(copilot-accept-word)
inoremap <A-c>d <Plug>(copilot-dismiss)
inoremap <A-c>k <Plug>(copilot-next)
inoremap <A-c>j <Plug>(copilot-previous)
nnoremap <leader>cop :Copilot panel<CR>

vnoremap <leader>y "+y
nnoremap <leader>y "+y

"LSP shortcuts
"Go to references (C-] works by default to jump to definition)
nnoremap <C-[> :lua vim.lsp.buf.references()<CR>
nnoremap <leader>a :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>d :lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"To simulate |i_CTRL-R| in terminal-mode: >vim
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

nnoremap <A-.> :vertical resize +5<CR>
nnoremap <A-,> :vertical resize -5<CR>
nnoremap <A-=> :resize +2<CR>
nnoremap <A--> :resize -2<CR>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <A-h> :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :<C-U>TmuxNavigateRight<cr>
nnoremap <silent> <A-\> :<C-U>TmuxNavigatePrevious<cr>
inoremap <silent> <A-h> <C-\><C-n>:<C-U>TmuxNavigateLeft<cr>
inoremap <silent> <A-j> <C-\><C-n>:<C-U>TmuxNavigateDown<cr>
inoremap <silent> <A-k> <C-\><C-n>:<C-U>TmuxNavigateUp<cr>
inoremap <silent> <A-l> <C-\><C-n>:<C-U>TmuxNavigateRight<cr>
inoremap <silent> <A-\> <C-\><C-n>:<C-U>TmuxNavigatePrevious<cr>

