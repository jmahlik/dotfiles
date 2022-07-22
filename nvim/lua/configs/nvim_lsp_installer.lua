local M = {}

local nvim_lsp_installer = require("nvim-lsp-installer")

M.setup = function()
    nvim_lsp_installer.setup {
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
        -- ensure_installed = {
            -- "ccls",
            -- "bashls",
            -- "clojure_lsp",
            -- "dockerls",
            -- "gopls",
            -- "html",
            -- "jsonls",
            -- "jdtls",
            -- "tsserver",
            -- "sumneko_lua",
            -- "zk",
            -- "pyright",
            -- "sqlls",
            -- "terraformls",
            -- "yamlls",
        -- },
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            }
        }
    }
end
return M
