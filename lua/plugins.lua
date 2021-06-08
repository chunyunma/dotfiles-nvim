return require('packer').startup(function(use)

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- autocomplete
    use {'SirVer/ultisnips'}
    use {'honza/vim-snippets'}

    use {'vim-pandoc/vim-pandoc'}
    use {'vim-pandoc/vim-pandoc-syntax'}

    use {'lervag/vimtex'}

    -- To dianose syntax highlighting issues
    use {'tpope/vim-scriptease'}

    -- open url, temporary replacing gx
    use {'tyru/open-browser.vim'} 

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

    -- LSP config
    use {'neovim/nvim-lspconfig'}
    -- <https://github.com/hrsh7th/nvim-compe>
    use {'hrsh7th/nvim-compe'}
    -- <https://github.com/ncm2/float-preview.nvim>
    use {'ncm2/float-preview'}

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
    -- <https://github.com/hoob3rt/lualine.nvim>
    use {'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup{
        options = {
          theme = 'gruvbox_material',
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
  }

  -- better language parser (syntax highlight)
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- use {'rmagatti/auto-session'}
  -- use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'} -- python related
  -- use {'zchee/deoplete-jedi'} -- python related
  -- use {'Shougo/deoplete-lsp'} -- python related

end)
