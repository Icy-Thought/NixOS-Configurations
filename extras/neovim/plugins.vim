" General Configurations 
" Active theme
colorscheme challenger_deep
let g:lightline = { 'colorscheme': 'challenger_deep'}

" Tranpsarency
" hi! Normal ctermbg=NONE guibg=NONE

" vim-startify
autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

" UltiSnips
let g:UltiSnipsExpandTrigger = '\<tab>'
let g:UltiSnipsJumpForwardTrigger = '\<tab>'
let g:UltiSnipsJumpBackwardTrigger = '\<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" NVIM-LSP
lua require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}

set completeopt=menuone,noinsert,noselect
let g:completion_confirm_key = "\<tab>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
