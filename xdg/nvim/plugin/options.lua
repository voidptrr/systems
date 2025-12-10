local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

opt.smartcase = true
opt.ignorecase = true

opt.splitbelow = true
opt.splitright = true

opt.swapfile = false
opt.wrap = true
opt.linebreak = true
opt.inccommand = "split"
opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'
