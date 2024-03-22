local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "volar", "emmet_ls", "eslint", "lua_ls", "tsserver" },
	handlers = {
		lsp_zero.default_setup,
	},
})

require("lspconfig").lua_ls.setup({
	-- ... other configs
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

require("copilot_cmp").setup()

local cmp = require("cmp")
-- local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	sources = {
		-- Copilot Source
		{ name = "copilot", group_index = 2 },
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "path", group_index = 2 },
	},
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- Ctrl+Space to trigger completion menu
		["<C-n>"] = cmp.mapping.complete(),
	}),
})

lsp_zero.set_sign_icons({
	error = "e",
	warn = "w",
	hint = "h",
	info = "i",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	command = "Neoformat",
})
-- lsp keybindings
-- Here's the full list:

-- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().

-- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
--
-- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
--
-- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
--
-- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
--
-- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
--
-- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
--
-- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
--
-- <F3>: Format code in current buffer. See :help vim.lsp.buf.format().
--
-- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().

-- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().

-- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().

-- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
