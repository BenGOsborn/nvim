-- Config
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

vim.api.nvim_command("set number relativenumber")
vim.api.nvim_command("set tabstop=2 shiftwidth=4")

-- Search
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>s", builtin.find_files, {})
vim.keymap.set("n", "<leader>g", builtin.git_files, {})

-- Color
function Theme(color) 
		color = color or "rose-pine"
		vim.cmd.colorscheme(color)

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Theme()

-- LSP
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})
