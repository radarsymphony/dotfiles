-- Copied from thePrimeagen: https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
vim.g.mapleader = ","

vim.keymap.set("n", "<leader>f", vim.cmd.Ex)
--Toggle netrw if it's not already open or go back to :last file if it is open
-- vim.keymap.set("n", "<leader>f", function()
--     if vim.bo.filetype == "netrw" then
--         vim.cmd("last")
--     else
--         vim.cmd("Ex")
--     end
-- end) 

-- Toggle line numbers
vim.keymap.set("n", "<leader>l", ":set number! relativenumber!<CR>")

-- In visual mode, move/slide selected line(s) up or down and intent as required
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")

-- Page up and down, but keep cursor in middle of the page (not top or bottom)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- Allows repeated pasting from buffer over top of selected text without updating buffer with replaced text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- Copy/yank into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Quickly find and replace all instances of word under cursor to word "breaks"
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- makes the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Save and run the current file
vim.keymap.set("n", "<M-R>", ":w <CR> :terminal %:p ")

-- Use 'esc' when in "terminal" mode to go back to normal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

