-- my custom stuff
local os_name = vim.loop.os_uname().sysname

local home = os.getenv("HOME")
if home == nil or home == ''
then
	home = os.getenv("USERPROFILE")
end

if os_name == "Linux" then
    vim.o.clipboard = "unnamedplus"
elseif os_name == "Darwin" or os_name == "Windows_NT" then
    vim.o.clipboard = "unnamed"
end

vim.wo.cursorline = true

-- tutorial stuff
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

