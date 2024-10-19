" COMUM
let mapleader = " "

map <Esc> :noh<CR>

" Desabilita compatibilidade com vi que pode causar tretas
set nocompatible

" Ajuda forcar plugins carregarem corretamente quando forem ligados novamente
filetype off

" Habilita plugins detectarem o tipo de identacao do tipo de arquivo
filetype plugin indent on

syntax on

" Highlight da linha horizontalmente no cursor
set cursorline

" Highlight da linha verticalmente no cursor
" set cursorcolumn

" Linhas numeradas
set number

" Linhas relativas
set relativenumber

" Mostra o status do arquivo
set ruler

" Encoding
set encoding=utf-8

" Seguranca?
set modelines=0

" Coluna de delimitacao de caracteres (80)
set colorcolumn=80

" Quebra de linha em vez de continuar horizontalmente
set wrap

" Reage de acordo com a sintaxe do arquivo
set smartindent

" Garante que espacos sejam usados para identar linhas, mesmo quando usar Tab
set expandtab

" Tamanho do tab
set tabstop=4

" Tamanho do tab na identacao manual (>> ou <<)
set shiftwidth=4

" Habilita menu de auto completion depois de apertar Tab
set wildmenu

" Faz o wildmenu parecer o Bash completion (?)
set wildmode=list:longest

" Habilita buffers escondidos
set hidden

" Renderizacao
set ttyfast

" Barra de status
set laststatus=2

" Mostra o modo atual de edicao
set showmode

" Mostra comandos parciais na ultima linha da tela
set showcmd

" Cores vivas
set termguicolors

" PLUGINS
call plug#begin()

" Tema
Plug 'morhetz/gruvbox'

" LSP e autocomplete
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" NERDTree File Explorer
Plug 'preservim/nerdtree'

call plug#end()

" Tema
"let g:gruvbox_(option) = '(value)'
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='dark'

" Python LSP
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

" Java LSP
if executable('eclipse-jdt-ls')
    au User lsp_setup call lsp#register_server({
        \   'name': 'eclipse-jdt-ls',
        \   'cmd': {server_info->[
        \     'java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Xmx1G',
        \     '-jar',
        \       expand('~/jdt-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'),
        \     '-configuration',
        \       expand('~/jdt-server/config_linux'),
        \     '-data',
        \       expand('~/jdt-server/data'),
        \     '--add-modules=ALL-SYSTEM',
        \     '--add-opens',
        \       expand('~/jdt-server/java.base/java.util=ALL-UNNAMED'),
        \     '--add-opens',
        \       expand('~/jdt-server/java.base/java.lang=ALL-UNNAMED')
        \   ]},
        \   'allowlist': ['java'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " Atalhos referentes ao LSP
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
