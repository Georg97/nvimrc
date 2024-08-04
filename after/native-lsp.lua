vim.lsp.start_client({
    name = 'my-server-name',
    cmd = { 'lua-language-server' },
    root_dir = vim.fs.dirname(vim.fs.find({'setup.py'}, {upward = true})[1])
})
