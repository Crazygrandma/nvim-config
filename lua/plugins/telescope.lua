return {
    'nvim-telescope/telescope.nvim',
    tag = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        -- Telescope pickers
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', function()
            builtin.buffers({
                attach_mappings = function(_, map)
                    local actions = require('telescope.actions')

                    map('i', '<C-j>', actions.move_selection_next)
                    map('i', '<C-k>', actions.move_selection_previous)

                    map('n', 'j', actions.move_selection_next)
                    map('n', 'k', actions.move_selection_previous)

                    return true
                end,
            })
        end, { desc = 'Telescope marks' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fm', function()
            builtin.marks({
                attach_mappings = function(_, map)
                    local actions = require('telescope.actions')

                    map('i', '<C-j>', actions.move_selection_next)
                    map('i', '<C-k>', actions.move_selection_previous)

                    map('n', 'j', actions.move_selection_next)
                    map('n', 'k', actions.move_selection_previous)

                    return true
                end,
            })
        end, { desc = 'Telescope marks' })

        -- Marks
        vim.keymap.set('n', '<leader>ma', 'ma', { desc = 'Set mark a' })
        vim.keymap.set('n', '<leader>ja', '`a', { desc = 'Jump to mark a' })

        vim.keymap.set('n', '<leader>mA', 'mA', { desc = 'Set global mark A' })
        vim.keymap.set('n', '<leader>jA', '`A', { desc = 'Jump to global mark A' })
    end
}
