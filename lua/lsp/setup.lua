require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install
                                   -- (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- How to write configuration files:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- After finished the configuration file, add it to the local servers under.
local servers = {
        sumneko_lua = require "lsp.lua",
        pylsp = require "lsp.python",
        clangd = require "lsp.c",
        rust_analyzer = require "lsp.rust-analyzer",
        tailwindcss = require "lsp.tailwindcss",
        tsserver = require "lsp.tsserver"
}


-- local lsp_installer = require "nvim-lsp-installer"

--for name,_ in pairs(servers) do
--        local server_is_found, server = lsp_installer.get_server(name)
--        if server_is_found then
--                if not server:is_installed() then
--                        print("Installing " .. name)
--                        server:install()
--                end
--        end
--end

