vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- center after half page jump
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })

-- jump to bottom and center
vim.keymap.set("n", "G", "Gzz", { noremap = true })

-- no highlight after search
vim.keymap.set("n", "<leader>nh", vim.cmd.noh)

-- move current line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- next and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- tab moves to end of line
vim.keymap.set("n", "<Tab>", "$")
vim.keymap.set("v", "<Tab>", "$")

-- paste and keep clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- format lsp not formatter like prettier
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- open terminal
vim.keymap.set("n", "<leader>ter", vim.cmd.terminal)

-- buffer stuff
-- close/kill buffer
vim.keymap.set("n", "<leader>bk", ":bd<CR>")

-- next / prev buffer
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")

-- comment line
vim.keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise()
end, { noremap = true, silent = true })

vim.keymap.set("v", "<leader>/", require("Comment.api").call("toggle.linewise", "g@"), { expr = true })

-- copilot stuff
-- copilot open panel
vim.keymap.set("n", "<leader>cp", function()
	require("copilot.panel").open()
end, { noremap = true, silent = true })

-- copilot disable
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true })

-- copilot enable
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { noremap = true, silent = true })
