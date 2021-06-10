require'nvim-treesitter.configs'.setup {
  ensure_installed = {
	-- "latex", syntax highlight from latex treesitter does not work with vimtex conceal
	"r",
	"lua",
	"bash"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
	enable = true,  -- false will disable the whole extension
	disable = { },  -- list of language that will be disabled
  },
  rainbow = {
	enable = true,
	extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
	max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
}
