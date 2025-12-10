local telescope = require("telescope")

telescope.setup({
    extensions = {
        wrap_results = true,
        fzf = {},
    }
})

pcall(telescope.load_extension, "fzf")

-- Keymaps
local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>cd", builtin.find_files)
vim.keymap.set("n", "<leader>gd", builtin.git_files)
vim.keymap.set("n", "<leader>cw", builtin.grep_string)
