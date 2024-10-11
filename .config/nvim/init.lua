local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- LSP Setup for tsserver (TypeScript/JavaScript)
local lspconfig = require'lspconfig'
lspconfig.ts_ls.setup{
  cmd = { "node", "./node_modules/.bin/typescript-language-server", "--stdio" },
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git")
}

lspconfig.tflint.setup{}
lspconfig.terraformls.setup{}
lspconfig.eslint.setup({
  cmd = { "node", "./node_modules/.bin/vscode-eslint-language-server", "--stdio" }, 
on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

require("conform").setup({
      formatters = {
        prettier = {
            -- cwd means "config working directory"
            require_cwd = true,

            cwd = require("conform.util").root_file({
                ".prettierrc",
                ".prettierrc.json",
                ".prettierrc.js",
                "prettier.config.js",
            }),
        },
    },
  formatters_by_ft = {
    javascript = { "prettier", stop_after_first = true },
    typescript = { "prettier", stop_after_first = true },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
  },
    format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})


-- Completion setup with nvim-cmp
local cmp = require'cmp'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- You can change this based on your snippet engine
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})

-- Enable nvim-tree with custom options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,    -- Enable the feature to auto-update the focus
    update_cwd = true, -- Optional: Update the working directory if needed
    ignore_list = {}     -- Ignore certain files if needed (leave empty if not)
  }
})

