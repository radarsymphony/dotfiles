local mark = require('harpoon.mark') 
local ui = require('harpoon.ui') 

vim.keymap.set("n", "<leader>i", mark.add_file)
vim.keymap.set("n", "<M-e>", ui.toggle_quick_menu) 

vim.keymap.set("n", "<M-t>", function() ui.nav_file(1) end) 
vim.keymap.set("n", "<M-s>", function() ui.nav_file(2) end) 
vim.keymap.set("n", "<M-r>", function() ui.nav_file(3) end) 
vim.keymap.set("n", "<M-a>", function() ui.nav_file(4) end) 
