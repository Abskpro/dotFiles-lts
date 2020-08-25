"basic settings
set number
set relativenumber
imap jj <ESC>
nnoremap <esc>^[ <esc>^[
set cursorline
set autoindent
set hlsearch
set background=dark
set tabstop=4
set nocompatible
syntax on
set mouse=c
set scroll=5
set showmatch
set shell
set timeoutlen=1000
set ttimeoutlen=0
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set undolevels=10000
set history=10000  
if has('persistent_undo')
	set undodir=$HOME/.vim/undo
	set undofile 
endif 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'stsewd/fzf-checkout.vim'
Plug 'morhetz/gruvbox' 
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'itchyny/lightline.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
  \}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
"gruvbox settings
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_italic=1
colorscheme gruvbox
let g:gruvbox_termcolors=256


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
	au!
	au FileType javascript setlocal foldmethod=syntax
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim jsdoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-l> <Plug>(jsdoc)#
nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Indent Lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '|', '?', '?']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ale settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" for eslint (ALE)
    let g:ale_sign_error = '●' " Less aggressive than the default '>>'
    let g:ale_sign_warning = '.'
    let g:ale_sign_errore_lint_on_enter = 0 " Less distracting when opening a new file
    let b:ale_fixers = ['prettier', 'eslint']
    let g:ale_set_highlights = 0
    let g:ale_fix_on_save = 1
    let g:ale_completion_enabled = 1
    let g:ale_completion_tsserver_autoimport = 1
    let g:airline#extensions#ale#enabled = 1
    "" for js	
    let g:javascript_plugin_jsdoc = 1
    let g:javascript_plugin_ngdoc = 1
    let g:javascript_plugin_flow = 1
    let g:ale_linters = {
                \   '*': ['remove_trailing_lines', 'trim_whitespace'],
                \  'javascript': ['eslint'],
                \  'python' : ['pycodestyle']
                \}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"emmet config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "" emmet config
    autocmd FileType html,css,js,javascript.jsx,typescript.tsx,typescript.ts EmmetInstall
    " autocmd FileType javascript set filetype:javascript.jsx 
    let g:user_emmet_install_global = 0
    let g:user_emmet_leader_key=','
    let g:user_emmet_settings = {
    \  'javascript' : {
    \      'extends' : 'jsx'
    \  },
    \ 'typescript':{
    \      'extends':'tsx'
    \   },
    \}
   let g:jsx_ext_required = 0  


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Nerd tree config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nnoremap <C-e> :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
  let g:NERDTreeWinPos = "left"
  let g:NERDTreeQuitOnOpen = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prettier#autoformat_require_pragma = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"for proper vim scrolling based on 25 % of screen height

function! ScrollQuarter(move)
     let height=winheight(0)

        if a:move == 'up'
             let key="\<C-Y>"
         else
             let key="\<C-E>"
         endif

         execute 'normal! ' . height/4 . key
endfunction
         

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"coc vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
if !has('gui_running')
		  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

function! LightlineFilename()
		  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
		          \ &filetype ==# 'unite' ? unite#get_status_string() :
		          \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
		          \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  endfunction

  let g:unite_force_overwrite_statusline = 0
  let g:vimfiler_force_overwrite_statusline = 0
  let g:vimshell_force_overwrite_statusline = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim react
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
" 	let g:coc_global_extensions += ['coc-prettier']
" endif

" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
" 	let g:coc_global_extensions += ['coc-eslint']
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_action = {
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit'
        \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>
augroup fzf
	autocmd!
	autocmd! FileType fzf
	autocmd  FileType fzf set laststatus=0 noshowmode noruler
		\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

