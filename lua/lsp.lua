vim.lsp.enable("lua_ls");
vim.lsp.enable("clangd");
vim.lsp.enable("pyright");

-- Qt installs qmlls outside the usual executable PATH on this system.
vim.lsp.config("qmlls", {
    cmd = { "/usr/lib/qt6/bin/qmlls" },
})
vim.lsp.enable("qmlls");

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
