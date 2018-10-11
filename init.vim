nmap <leader>ne :NERDTree<cr>

let g:python_host_prog = $NEOVIM_PYTHON2_PATH .'/bin/python'
let g:python3_host_prog = $NEOVIM_PYTHON3_PATH .'/bin/python'

"let g:LanguageClient_serverCommands = {}

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-ultisnips'
Plug 'neomake/neomake', {'for': ['rust']}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
"  Plug 'ncm2/ncm2-racer', { 'for': 'rust' }
endif

if executable('elixir')
	Plug 'elixir-editors/vim-elixir'
	Plug 'slashmili/alchemist.vim'
"	let g:LanguageClient_serverCommands.elixir = [ $HOME .'/.language_servers/elixir-ls/language_server.sh']
endif

if executable('go')
	Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}
endif

call plug#end()

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect

let g:deoplete#sources#rust#racer_binary= $HOME .'/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path= $RUST_SRC_DIR
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#enable_at_startup=1
let g:racer_experimental_completer=1

call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
