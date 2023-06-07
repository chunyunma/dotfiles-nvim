-- Most of this file was adpated from here
-- <https://github.com/kabouzeid/nvim-lspinstall/wiki> and
-- <https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration>

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
  ensure_installed = {
    -- 'r_language_server',
    'lua_ls',
  },
}

local lspconfig = require("lspconfig")

-- Mappings
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist, opts)

-- Your custom attach function for nvim-lspconfig goes here.
local on_attach = function(client, bufnr)

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>law', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>lrw', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>llw', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f',
    function() vim.lsp.buf.format { async = true } end,
    bufopts)

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.documentFormattingProvider then
        vim.keymap.set("n", "<leader>lf",
        function() vim.lsp.buf.format { async = true } end, bufopts)
    elseif client.server_capabilities.documentRangeFormattingProvider then
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.range_formatting, bufopts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
    library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  },
}

-- config that activates keymaps and enables snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Code actions
capabilities.textDocument.codeAction = {
  -- dynamicRegistration = true
  dynamicRegistration = false,
  codeActionLiteralSupport = {
    codeActionKind = {
      valueSet = (function()
        local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
        table.sort(res)
        return res
      end)()
    }
  }
}

local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- signs = false,
    update_in_insert = false,
    -- Disable virtual_text
    virtual_text = false,
  }
  )
}


-- local lsp_installer = require "nvim-lsp-installer"
-- -- Include servers to be installed by nvim-lsp-installer
-- local servers = {
--   "sumneko_lua",
--   "texlab",
-- }


--
-- for _, name in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       print("Installing " .. name)
--       server:install()
--     end
--   end
-- end
--
-- local customize_server_opts = {
--   ["lua_ls"] = function(default_opts)
--     default_opts.settings = lua_settings
--   end,
-- }

-- config servers already supported by nvim-lsp-installer
-- lsp_installer.on_server_ready(function(server)
lspconfig['lua_ls'].setup {
	-- local config = make_config()
  -- local default_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
    settings = lua_settings
  }

  -- language specific config
  -- if customize_server_opts[server.name] then
  --   customize_server_opts[server.name](default_opts)
  -- end
  -- server:setup(default_opts)
-- end)

-- until nvim-lsp-installer can support R
lspconfig.r_language_server.setup{
	-- map buffer local keybindings when the language server attaches
  on_attach = on_attach,
  -- flags = { debounce_text_changes = 150 },
  capabilities = capabilities,
  -- seems to be equivalent to the next line, which is simpler and preferable
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
	-- settings = {
	-- 	diagnostics = false,
	-- },
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = false,
			signs = true,
			update_in_insert = true,
			-- Disable virtual_text
			virtual_text = false,
		}),
	},
}
--

vim.g.LanguageClient_serverCommands = {
    r = {'R', '--slave', '-e', 'languageserver::run()'}
    }
