# nvimrc
Custom nvimrc. Made with tutorial from ThePrimeagen

## TODO for next config updates/iterations

Stuff to consider, when I update my config the next time

- lazy.vim instead of packer (does it really make sense)
- lazygit instead of fugitive
- luasnip with friendly-snippets and custom vscode-snippets (so i can copy them over)
    - have vscode-style snippet support for global snippets
    - have vscode-style snippet support for snippets in current directory
    - try other snippet styles (not mandatory)
- optimize Key-Bindings (merge with LazyVim + current ones)
    - <leader><leader> --> search
    - <leader><leader>/ --> grep in files
    - strg+hjkl --> switch panes in buffer
- share clipboard with system
- show search result count (e.g. [2/4])
- somehow optimize file management (maybe try something with ranger)
- show bottom information line like (e.g. vscode, LazyVim)
- get c# lsp to work properly
- show next possible commands
- do not copy the deleted stuff after putting (eg yy -> p removes content of yank clipboard)
- open file-view (<leader>pv) default in hierarchie mode (currently need to press 3x i)
