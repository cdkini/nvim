local nvim_lsp = require('lspconfig')
local coq = require('coq')
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }
vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.cmd("nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>")
vim.cmd("nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>")
vim.cmd("nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>")
vim.cmd("nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
vim.cmd("nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
    severity_sort = true,
  }
)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


vim.g.coq_settings = {
    auto_start = true,
    keymap = {
        jump_to_mark = "<C-n>"
    }
}

require'lspconfig'.pyright.setup{
    on_attach = function(client, bufnr)
        require 'lsp_signature'.on_attach({
            floating_window = false,
            hint_prefix = ' '
        })
    end,
    coq.lsp_ensure_capabilities{
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                    diagnosticSeverityOverrides = {
                        reportGeneralTypeIssues = "warning",
                        reportPropertyTypeMismatch = "warning",
                        reportTypedDictNotRequiredAccess = "warning"
                    }
                }
            }
        }
    }
}

require'lspconfig'.tsserver.setup{}
require'lspconfig'.gopls.setup{
    coq.lsp_ensure_capabilities{},
    cmd = {'gopls', '--remote=auto'}
}

vim.cmd([[COQnow -s]])
