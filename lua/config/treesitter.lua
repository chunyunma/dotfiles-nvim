-- updated based on the latest README of treesitter

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
	-- "latex", syntax highlight from latex treesitter does not work with vimtex conceal
	"r",
	"lua",
  "c",
  "markdown", -- seems to conflict with pandoc plugin for highlight
  "vim",
  "vimdoc",
  "query",
	"bash"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false,
  -- auto_install = true, -- disabled so that it won't automatically install markdown parser
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
	enable = true,  -- false will disable the whole extension
	disable = { },  -- list of language that will be disabled
  },
  additional_vim_regex_highlighting = false,
  rainbow = {
	enable = true,
	extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
	max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
}
