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

local servers = {
        sumneko_lua = require "lsp.lua",
        pylsp = require "lsp.python"
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

