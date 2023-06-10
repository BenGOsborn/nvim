local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>s", builtin.find_files, {})
vim.keymap.set("n", "<leader>g", builtin.git_files, {})
