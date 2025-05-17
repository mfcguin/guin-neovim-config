-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- 块间移动 (Move between blocks)
--keymap.set({ "n", "v" }, "H", "^", opts)
--keymap.set({ "n", "v" }, "L", "g_", opts)
keymap.set('n','x', '"_x')
keymap.set({'n', 'v'}, 'c', '"_c')
keymap.set({'n', 'v'}, 'C', '"_C')
keymap.set({'n', 'v'}, 's', '"_s')
keymap.set({'n', 'v'}, 'S', '"_S')
keymap.set({'n', 'v'}, '<leader>d', '"_d')
keymap.set({'n', 'v'}, '<leader>D', '"_dd')
keymap.set({ "n", "v" }, "J", "5j", opts)
keymap.set({ "n", "v" }, "K", "5k", opts)
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- 窗口分隔操作
-- 将 "sv" 映射为 ":vsp"
keymap.set("n", "sv", ":vsp<CR>", { desc = "垂直分隔窗口" })

-- 将 "sh" 映射为 ":sp"
keymap.set("n", "sh", ":sp<CR>", { desc = "水平分隔窗口" })

-- 将 "sc" 映射为 ":q"
keymap.set("n", "sc", ":q<CR>", { desc = "关闭当前窗口" })

-- 将 "so" 映射为 ":only"
keymap.set("n", "so", ":only<CR>", { desc = "关闭其他窗口" })

-- 窗口间移动
keymap.set("n", "<C-h>", "<C-w>h", { desc = "移动到左侧窗口" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "移动到右侧窗口" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "移动到下方窗口" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "移动到上方窗口" })

-- 重做操作
keymap.set("n", "U", "<C-r>", { desc = "重做" })

keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })
