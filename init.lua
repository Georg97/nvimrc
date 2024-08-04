require("base")

if vim.g.vscode then
    -- VSCode extension
    --
    require("vscode-mode")
else
    -- ordinary Neovim
    require("plugins")

    vim.g.netrw_liststyle = 0
end
