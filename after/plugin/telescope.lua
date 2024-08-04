local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", telescope.find_files, {})
vim.keymap.set("n", "<leader>/", telescope.live_grep, {})
vim.keymap.set("n", "<leader>gs", telescope.grep_string, {})
vim.keymap.set("n", "<leader>?", telescope.help_tags, {})

-- not sure if I will need these
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>cmd", telescope.commands, {})
vim.keymap.set("n", "<leader>clr", telescope.colorscheme, {})
