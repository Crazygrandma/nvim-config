


vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Esc>")

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- Disable in insert mode
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")

-- Optional: also disable in visual mode
vim.keymap.set("v", "<Up>", "<Nop>")
vim.keymap.set("v", "<Down>", "<Nop>")
vim.keymap.set("v", "<Left>", "<Nop>")
vim.keymap.set("v", "<Right>", "<Nop>")


-- Terminal Job
local job_id = 0

-- configurable commands
local run_commands = {
    "make",
    "./app",
}

vim.keymap.set("n", "<space>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 5)

    job_id = vim.bo.channel

    vim.fn.chansend(job_id, "clear\r\n")
    -- send all commands
    for _, cmd in ipairs(run_commands) do
        vim.fn.chansend(job_id, cmd .. "\r\n")
    end
end)



