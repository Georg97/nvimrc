# nvimrc

Starting Config from Scratch on this branch.

## Goals

The goal is to become articulate with configuring nvim and have a simple, custom-streamlined
user experience, which makes me productive, while removing a lot of clutter from my editor.

### New Considerations

- [] lazy.vim, because: want to setup myself without "cheating by looking at old config" and: potential performance gain and: learn alternative to packer, to deepen knowledge of nvim ecosystem
- [] KISS, only install plugin when the need really comes up during active development
- [] Better config management (dotfile management in general) for easier reproducability
- [] bootstrapping process, to make installation on a new system as easy as possible
- [] manually setup lsp at least once (without mason, lsp-zero etc.). This is to learn how an lsp installation works

#### learned so far

- you can navigate project with "find". But this probably won't work on windows
- Starting an LSP is easy, but configuring it is a "pain in the ass", since there are tons of options and considerations to take into account (file matching, continuously checking the lsp for updates for autocomplete etc)
- packer is not maintained anymore, which makes lazy.vim a sane choice rn. But also makes one think, how stable it will be, if it is basically maintained by only one person

### Features

- [x] lazy.vim package manager
- [x] telescope
- [] support for go development
- [] lsp support
- [] "vscode mode" which helps using vscode with nvim plugin
    - [] switch between file content and console
    - [] sequential number support
    - [] <leader><leader> to open f1-menu (to act like telescope)
    - [] <leader>gg to open lazygit

---

## From old config
### TODO for next config updates/iterations

Stuff to consider, when I update my config the next time

- lazy.vim instead of packer (does it really make sense)
- luasnip with friendly-snippets and custom vscode-snippets (so i can copy them over)
    - have vscode-style snippet support for global snippets
    - have vscode-style snippet support for snippets in current directory
    - try other snippet styles (not mandatory)
- optimize Key-Bindings (merge with LazyVim + current ones)
    - strg+hjkl --> switch panes in buffer (conflicts with harpoon)
- show search result count (e.g. [2/4])
- somehow optimize file management (maybe try something with ranger)
- show bottom information line like (e.g. vscode, LazyVim)
- get c# lsp to work properly
- show next possible commands
- ~~lazygit instead of fugitive~~
- ~~optimize Key-Bindings (merge with LazyVim + current ones)~~
    - ~~<leader><leader> --> search~~
    - ~~<leader><leader>/ --> grep in files~~
- ~~do not copy the deleted stuff after putting (eg yy -> p removes content of yank clipboard)~~
- ~~share clipboard with system~~
- ~~open file-view (<leader>pv) default in hierarchie mode (currently need to press 3x i)~~
