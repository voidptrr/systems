local ok, cmp = pcall(require, "cmp_nvim_lsp")

if not ok then
    vim.notify("cmp_nvim not found")
    vim.exit()
end

local capabilities = cmp.default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

local servers = { "rust_analyzer", "lua_ls", "nixd" }
for _, name in ipairs(servers) do
    vim.lsp.enable(name)
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Keymaps
        local builtin = require "telescope.builtin"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr })
        vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = bufnr })
        vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = bufnr })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })


        vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
    end
})
