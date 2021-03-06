return require('packer').startup(function(use)

  --
  -- stable section
  --
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- <https://github.com/p00f/nvim-ts-rainbow>
    use {'p00f/nvim-ts-rainbow'}

    use {'vim-pandoc/vim-pandoc'}
    use {'vim-pandoc/vim-pandoc-syntax'}

    use {'lervag/vimtex'}
    -- use {'lervag/vimtex', tag='v1.6'}
    -- use {'KeitaNakamura/tex-conceal.vim'}

    -- To dianose syntax highlighting issues
    -- use {'tpope/vim-scriptease'}

    -- Development
    use {'tpope/vim-surround'}
    use {'wellle/targets.vim'}

    -- enable dot command for surround.vim
    use {'tpope/vim-repeat'}

    -- Color scheme
    -- <https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt>
    use {'sainnhe/gruvbox-material'} -- need `require('config.colorscheme')`
    -- use { 'chriskempson/base16-vim' } -- also need to enable plugin/color.vim

    -- helpful editing
    use {'tpope/vim-unimpaired'}

    -- work with netrw
    use {'tpope/vim-vinegar'}

    -- easy git
    use {'tpope/vim-fugitive'}

    -- Lua development
    -- <https://github.com/tjdevries/nlua.nvim>
    use {'tjdevries/nlua.nvim'}

    -- fuzzy finder
    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim'}

    -- easy editing with s-expressions in Racket
    -- <https://github.com/tpope/vim-sexp-mappings-for-regular-people>
    -- <https://gist.github.com/cszentkiralyi/a9a4e78dc746e29e0cc8>
    use{ 'guns/vim-sexp'}
    use {'tpope/vim-sexp-mappings-for-regular-people'}

    -- navigate tmux
    use {'christoomey/vim-tmux-navigator'}

    -- vim-slime to work with tmux
    use {'jpalardy/vim-slime'}

    -- easy jump around like acejump for sublime
    use {'easymotion/vim-easymotion'}

    -- show marks
    use {'kshenoy/vim-signature'}

    -- toggle comment
    use {'tomtom/tcomment_vim'}

    -- tagbar for bird's eye view of doc
    use {'preservim/tagbar'}

    -- edit simple tables
    use {'dhruvasagar/vim-table-mode'}

    -- work with R
    use {'jalvesaq/Nvim-R', branch = 'master'}

    -- Status line
    -- <https://github.com/shadmansaleh/lualine.nvim>
    use {'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup{
        options = {
          theme = 'gruvbox-material',
          section_separators = {'???', '???'},
          component_separators = {'???', '???'},
          disabled_filetypes = {},
          icons_enabled = true,
        },
        sections = {
          lualine_a = { {'mode', upper = true} },
          lualine_b = { {'branch', icon = '???'} },
          lualine_c = { {'filename', file_status = true} },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location'  },
        },
        inactive_sections = {
          lualine_a = {  },
          lualine_b = {  },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {  },
          lualine_z = {  }
        },
        extensions = { 'fzf', 'fugitive'}
      }
    end
  }

  --
  -- volatile section
  --

    -- LSP config
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/nvim-lsp-installer'}

    -- autocomplete
    use {'SirVer/ultisnips'}
    use {'honza/vim-snippets'}

    -- -- <https://github.com/hrsh7th/nvim-compe>
    -- use {'hrsh7th/nvim-compe'}
    -- -- <https://github.com/ncm2/float-preview.nvim>
    -- use {'ncm2/float-preview'}
    -- new cmp
    -- use "tamago324/cmp-zsh" -- look this one up
    use {
        "onsails/lspkind-nvim",
        config = function()
            require("lspkind").init()
        end,
    }

    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "quangnguyen30192/cmp-nvim-ultisnips",
        'quangnguyen30192/cmp-nvim-tags',
        "hrsh7th/cmp-nvim-lua",
        -- "octaltree/cmp-look",
        "hrsh7th/cmp-path",
        -- "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        -- "hrsh7th/cmp-emoji",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
      },
      config = function()
        require("config.cmp").setup()
      end,
    }

  -- better language parser (syntax highlight)
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'} -- python related
  -- use {'zchee/deoplete-jedi'} -- python related
  -- use {'Shougo/deoplete-lsp'} -- python related

end)
