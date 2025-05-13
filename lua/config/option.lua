if vim.g.neovide then
  -- 允许剪贴板访问
  vim.g.neovide_input_use_logo = true -- 启用 Command 键（macOS）

  -- 映射 Cmd+V 到粘贴系统剪贴板
  vim.keymap.set("n", "<D-v>", '"+p', { silent = true }) -- 普通模式下粘贴
  vim.keymap.set("v", "<D-v>", '"+p', { silent = true }) -- 可视模式下粘贴
  vim.keymap.set("i", "<D-v>", '<ESC>"+pa', { silent = true }) -- 插入模式下粘贴
  vim.keymap.set("c", "<D-v>", "<C-r>+", { silent = true }) -- 命令模式下粘贴

  -- 映射 Cmd+C 到复制到系统剪贴板
  vim.keymap.set("v", "<D-c>", '"+y', { silent = true }) -- 可视模式下复制

  -- 映射 Cmd+X 到剪切到系统剪贴板
  vim.keymap.set("v", "<D-x>", '"+d', { silent = true }) -- 可视模式下剪切
end

local opt = vim.opt
opt.signcolumn = 'yes'
opt.number = true
opt.relativenumber = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

opt.mouse:append 'a'
opt.clipboard:append 'unnamedplus'

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

-- opt.cursorline = true
opt.termguicolors = true

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})
