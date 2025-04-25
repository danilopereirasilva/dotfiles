" COMUM
" Alguns remaps
let mapleader = " "


" escreve (salva) o buffer
nmap <Leader>w :w<CR>

" abre o explorer
nmap <Leader>ge :E<CR>

" fecha o buffer atual
nmap <Leader>x :bd<CR>

" proximo buffer
nmap <S-L> :bn<CR>

" buffer anterior
nmap <S-H> :bp<CR>

" lista os buffers abertos
nmap <Leader><Leader> :ls<CR>

" limpa o highlight
nmap <Leader>h :noh<CR>

" adicionar ao path o diretorio desejado para busca
nmap <Leader>pa :set path+=

" busca arquivos no path
nmap <Leader>sf :find 

" procura e abre o arquivo para edicao
nmap <Leader>ef :e **/

" fecha o vim todo
nmap <Leader>qq :qa<CR>

" Troca entre telas
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Mantém a seleção ao identar
vnoremap < <gv
vnoremap > >gv

" Permite criar arquivos que ainda não existem no path
map gf :edit <cfile><CR>

" fim dos remaps
"
" netrw em modo arvore
let g:netrw_liststyle=3

" Desabilita compatibilidade com vi que pode causar tretas
set nocompatible

" Ajuda forcar plugins carregarem corretamente quando forem ligados novamente
filetype off

" Habilita plugins detectarem o tipo de identacao do tipo de arquivo
filetype plugin indent on

filetype plugin on

syntax on

" Highlight da linha horizontalmente no cursor
set cursorline

" Highlight da linha verticalmente no cursor
set cursorcolumn

" Linhas numeradas
set number

" Linhas relativas
set relativenumber

set scrolloff=10

if v:version >= 800
    " impede o vim de zoar silenciosamente com arquivos que não deveria
    set nofixendofline
endif

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

" plugins e algumas outras coisas precisam disso
if has("syntax")
    syntax enable
endif

" Renderizacao
set ttyfast

" Barra de status
set laststatus=2

" Mostra o modo atual de edicao
set noshowmode

" Mostra comandos parciais na ultima linha da tela
set showcmd

" Cores vivas
set termguicolors

" Clipboard
set clipboard=unnamedplus

" inicio vim-lsp
call plug#begin()

" Tema
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'ryanoasis/vim-devicons'
Plug 'rose-pine/vim'

" LSP e autocomplete
Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Comentar
Plug 'tpope/vim-commentary'

" NERDtree
Plug 'preservim/nerdtree'
" abrir nerdtree
nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>no :NERDTreeToggle<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
"
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

call plug#end()

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " Atalhos referentes ao LSP
    " nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    " nmap <buffer> gr <plug>(lsp-references)
    " nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    " nmap <buffer> <leader>rn <plug>(lsp-rename)
    " nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go,*.py,*.java call execute('LspDocumentFormatSync')

endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" fim  vim-lsp

" inicio CoC
" configura TAB pra navegar nas sugestoes do autocomplete
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" configura ENTER pra confirmar selecao do autocomplete
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" navegacao de diagnostico
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)

" atalhos do tipo GoTo
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K para mostrar descricao em hover
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" da um highlight no simbolo e em suas referencias
autocmd CursorHold * silent call CocActionAsync('highlight')

" renomeia simbolos
nmap <silent> <Leader>rn <Plug>(coc-rename)

" Atalhos para codeaction na selecao de bloco
" Example: `<leader>aap` for current paragraph
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)

" codeaction na posicao do cursor
nmap <Leader>ac  <Plug>(coc-codeaction-cursor)

" codeaction em todo buffer
nmap <Leader>as  <Plug>(coc-codeaction-source)

" quickfix no diagnostico da linha atual
nmap <Leader>qf  <Plug>(coc-fix-current)

" codeaction para refatoracao de codigo
nmap <silent> <Leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <Leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <Leader>r  <Plug>(coc-codeaction-refactor-selected)
" fim CoC

" inicio Tema
" let g:gruvbox_material_background='medium'
" let g:gruvbox_material_better_performance = 1

if has('termguicolors')
    set termguicolors
endif

set background=dark

colorscheme rosepine

hi Normal guibg=NONE ctermbg=NONE


" fim Tema

