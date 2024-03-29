local M = {}

vim.lsp.buf.format({
    timeout_ms = 1000,
    filter = function(client) return client.name ~= "tsserver" end
})

-- get all installed servers
local servers = {
    "ccls",
    "bashls",
    "clojure_lsp",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "jdtls",
    "tsserver",
    "sumneko_lua",
    "prosemd_lsp",
    "pyright",
    "sqlls",
    "terraformls",
    "yamlls",
}

-- Config.settings for lsp servers
local configs = {
    sumneko_lua = {
        Lua = {
            runtime = {
                -- LuaJIT in the case of Neovim
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    -- [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                },
            },
        },
    },
    python = {
        python = {
            pythonPath = "python",
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
}

local on_attach = function(client, bufnr)
    -- Attach to server
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "<leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-l>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.documentRangeFormattingProvider then
        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.server_capabilities.documentRangeFormattingProvider then
        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]]       ,
            false
        )
    end
end

-- config that activates keymaps and enables snippet support
local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach,
    }
end

M.setup = function()
    for _, server in pairs(servers) do
        local config = make_config()
        -- language specific cusom config
        if configs[server] ~= nil then
            config.settings = configs[server]
        end
        require("lspconfig")[server].setup(config)
    end

end

return M
