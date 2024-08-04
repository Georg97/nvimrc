vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- helpful commands
-- print config
vim.keymap.set("n", "<leader>getc", ":echo stdpath('config')")

-- archaic telescope
-- vim.keymap.set("n", "<leader><leader>", ":vnew | r!find . -regex .+.+<Left><Left>")
-- vim.keymap.set("n", "<leader>o", "yy:<C-u>e <C-r>\"", {noremap = true})

