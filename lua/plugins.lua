return {

  --
  -- stable section
  --
    -- Packer can manage itself as an optional plugin
    {'wbthomason/packer.nvim', lazy = true},
    -- <https://github.com/hiphish/rainbow-delimiters.nvim>
    'hiphish/rainbow-delimiters.nvim',

    -- 'vim-pandoc/vim-pandoc',
    -- 'vim-pandoc/vim-pandoc-syntax',

    'lervag/vimtex',
    -- 'lervag/vimtex', tag='v1.6',
    -- 'KeitaNakamura/tex-conceal.vim',

    -- To dianose syntax highlighting issues
    -- 'tpope/vim-scriptease',

    -- Development
    'tpope/vim-surround',
    'wellle/targets.vim',

    -- enable dot command for surround.vim
    'tpope/vim-repeat',

    -- Color scheme
    -- <https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt>
    'sainnhe/gruvbox-material', -- need `dependencies('config.colorscheme')`
    -- use { 'chriskempson/base16-vim' } -- also need to enable plugin/color.vim

    -- helpful editing
    'tpope/vim-unimpaired',

    -- work with netrw
    'tpope/vim-vinegar',

    -- easy git
    'tpope/vim-fugitive',

    -- Lua development
    -- <https://github.com/tjdevries/nlua.nvim>
    'tjdevries/nlua.nvim',

    -- fuzzy finder
    'junegunn/fzf',
    'junegunn/fzf.vim',

    -- easy editing with s-expressions in Racket
    -- <https://github.com/tpope/vim-sexp-mappings-for-regular-people>
    -- <https://gist.github.com/cszentkiralyi/a9a4e78dc746e29e0cc8>
    'guns/vim-sexp',
    'tpope/vim-sexp-mappings-for-regular-people',

    -- navigate tmux
    -- 'christoomey/vim-tmux-navigator',
    {
      "alexghergh/nvim-tmux-navigation",
      event = "VeryLazy",
      config = function()
        local nvim_tmux_nav = require("nvim-tmux-navigation")
        nvim_tmux_nav.setup({
          disable_when_zoomed = true,
          -- defaults to false
          keybindings = {
            left = "<C-h>",
            down = "<C-j>",
            up = "<C-k>",
            right = "<C-l>",
            last_active = "<C-\\>",
            next = "<C-Space>",
          },
        })
      end,
    },
    -- vim-slime to work with tmux
    'jpalardy/vim-slime',

    -- easy jump around like acejump for sublime
    'easymotion/vim-easymotion',

    -- show marks
    'kshenoy/vim-signature',

    -- toggle comment
    -- 'tomtom/tcomment_vim',
    {
      'numToStr/Comment.nvim',
      opts = {
        -- add any options here
      },
      lazy = false,
      config = function()
        require('Comment').setup()
      end,
    },

    -- edit simple tables
    'dhruvasagar/vim-table-mode',

    -- work with R
    {'jalvesaq/Nvim-R', branch = 'master'},

    -- Status line
    -- <https://github.com/shadmansaleh/lualine.nvim>
    {'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons', lazy = true},
    config = function()
      require('lualine').setup{
        options = {
          theme = 'gruvbox-material',
          section_separators = {'', ''},
          component_separators = {'', ''},
          disabled_filetypes = {},
          icons_enabled = true,
        },
        sections = {
          lualine_a = { {'mode', upper = true} },
          lualine_b = { {'branch', icon = ''} },
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
  },

  --
  -- volatile section
  --

    -- autocomplete
    'SirVer/ultisnips',
    'honza/vim-snippets',

    -- -- <https://github.com/hrsh7th/nvim-compe>
    -- 'hrsh7th/nvim-compe',
    -- -- <https://github.com/ncm2/float-preview.nvim>
    -- 'ncm2/float-preview',
    -- new cmp
    -- use "tamago324/cmp-zsh" -- look this one up
    {
        "onsails/lspkind-nvim",
        config = function()
            require("lspkind").init()
        end,
    },

    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "jalvesaq/cmp-nvim-r",
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
    },

    -- LSP config
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- 'williamboman/nvim-lsp-installer',


  -- better language parser (syntax highlight)
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'} -- python related
  -- 'zchee/deoplete-jedi', -- python related
  -- 'Shougo/deoplete-lsp', -- python related

  { 'aadv1k/gdoc.vim', build = './install.py' },

}

