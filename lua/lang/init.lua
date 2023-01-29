-- Most of this file was adpated from here
-- <https://github.com/kabouzeid/nvim-lspinstall/wiki> and
-- <https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration>

-- Your custom attach function for nvim-lspconfig goes here.
local on_attach = function(client, bufnr)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',opts)
    buf_set_keymap('n', '<leader>law','<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>lrw','<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>llw','<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',opts)
    buf_set_keymap('n', '<leader>lt','<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>lrf', '<cmd>lua vim.lsp.buf.references()<CR>',opts)
    buf_set_keymap('n', '<leader>ld','<cmd>lua vim.diagnostic.open_float()<CR>',opts)
    buf_set_keymap('n', '<leader>ll','<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>',opts)

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.documentFormattingProvider then
        buf_set_keymap("n", "<leader>lf","<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.server_capabilities.documentRangeFormattingProvider then
        buf_set_keymap("n", "<leader>lf","<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
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


local lsp_installer = require "nvim-lsp-installer"
-- Include servers to be installed by nvim-lsp-installer
local servers = {
  "sumneko_lua",
  "texlab",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

local customize_server_opts = {
  ["sumneko_lua"] = function(default_opts)
    default_opts.settings = lua_settings
  end,
}

-- config servers already supported by nvim-lsp-installer
lsp_installer.on_server_ready(function(server)
	-- local config = make_config()
  local default_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  }

  -- language specific config
  if customize_server_opts[server.name] then
    customize_server_opts[server.name](default_opts)
  end
  server:setup(default_opts)
end)

-- until nvim-lsp-installer can support R
local lspconfig = require 'lspconfig'
lspconfig.r_language_server.setup({
	-- map buffer local keybindings when the language server attaches
	on_attach = on_attach,
  capabilities = capabilities,
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
})

