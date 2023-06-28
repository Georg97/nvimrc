vim.g.lexima_enable_basic_rules = 1
vim.g.lexima_enable_newline_rules = 1

vim.cmd [[
    call lexima#add_rule({'char': '<', 'input_after': '</>', 'filetype': 'html'})
    call lexima#add_rule({'char': '<', 'input_after': '</>', 'filetype': 'xml'})
    call lexima#add_rule({'char': '<', 'input_after': '</>', 'filetype': 'tsx'})
    call lexima#add_rule({'char': '<', 'input_after': '</>', 'filetype': 'csproj'})
    call lexima#add_rule({'char': '<', 'input_after': '</>', 'filetype': 'cshtml'})
    
    call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'latex'})
    call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'latex'})
    call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'latex'})
]]

