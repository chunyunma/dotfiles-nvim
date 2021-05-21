" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/chunyun/.config/cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/chunyun/.config/cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/chunyun/.config/cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/chunyun/.config/cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/chunyun/.config/cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["Nvim-R"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/Nvim-R"
  },
  ["float-preview"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/float-preview"
  },
  fzf = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\6\0\31\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0004\4\3\0005\5\v\0>\5\1\4=\4\r\0034\4\3\0005\5\14\0>\5\1\4=\4\15\0034\4\3\0005\5\16\0>\5\1\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0025\3\29\0=\3\30\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\bfzf\rfugitive\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\b\14lualine_a\1\0\0\1\2\1\0\tmode\nupper\2\foptions\1\0\0\23disabled_filetypes\25component_separators\1\3\0\0\b\b\23section_separators\1\3\0\0\b\b\1\0\2\ntheme\21gruvbox_material\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/targets.vim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-scriptease"
  },
  ["vim-sexp"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-sexp"
  },
  ["vim-sexp-mappings-for-regular-people"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-sexp-mappings-for-regular-people"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-slime"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-slime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-table-mode"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/chunyun/.config/local/share/nvim/site/pack/packer/start/vim-vinegar"
  }
}

time("Defining packer_plugins", false)
-- Config for: lualine.nvim
time("Config for lualine.nvim", true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\31\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0004\4\3\0005\5\v\0>\5\1\4=\4\r\0034\4\3\0005\5\14\0>\5\1\4=\4\15\0034\4\3\0005\5\16\0>\5\1\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0025\3\29\0=\3\30\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\bfzf\rfugitive\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\b\14lualine_a\1\0\0\1\2\1\0\tmode\nupper\2\foptions\1\0\0\23disabled_filetypes\25component_separators\1\3\0\0\b\b\23section_separators\1\3\0\0\b\b\1\0\2\ntheme\21gruvbox_material\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time("Config for lualine.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
