local g = vim.g
local opt = vim.opt

g.everforest_background = "hard"
g.everforest_enable_italic = true
g.everforest_ui_contrast = "high"
g.everforest_transparent_background = true
g.everforest_colors_override = {bg0 = {"#1e2326", "234" }}

opt.background = "dark"
opt.termguicolors = true

vim.cmd.colorscheme("everforest")
