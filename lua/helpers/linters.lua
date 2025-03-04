require("lint").linters_by_ft = {
	markdown = { "vale" },
	haskell = { "hlint" },
	html = { "tidy" },
}

local tidy = require("lint").linters.tidy
tidy.ignore_exitcode = true

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "eslint_d", { "prettierd", "prettier" } },
		typescript = { "eslint_d", { "prettierd", "prettier" } },
		javascriptreact = { "eslint_d", { "prettierd", "prettier" } },
		typescriptreact = { "eslint_d", { "prettierd", "prettier" } },
		-- sql = { "sql_formatter" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.keymap.set({ "n", "x", "v" }, "<C-f>", function()
	require("conform").format({ async = true, timeout_ms = 10000 })
end, {})

local function use_custom_linter()
	local filetype = vim.bo.filetype
	local filename = vim.api.nvim_buf_get_name(0)
	local commands = {
		javascript = "npx eslint --fix " .. filename,
		typescript = "npx eslint --fix " .. filename,
		javascriptreact = "npx eslint --fix " .. filename,
		typescriptreact = "npx eslint --fix " .. filename,
	}

	if commands[filetype] ~= nil then
		vim.cmd("w")
		os.execute(commands[filetype])
		vim.cmd("e!")
		print(commands[filetype])
	else
		print("No command found for " .. filetype .. " file type")
	end
end

vim.keymap.set("n", "<leader>cl", "<cmd>lua use_custom_linter()<CR>", { noremap = true, desc = "[C]ustom [l]inter" })

local function use_custom_formatter()
	local filetype = vim.bo.filetype
	local filename = vim.api.nvim_buf_get_name(0)
	local commands = {
		javascript = "npx prettier --write " .. filename,
		typescript = "npx prettier --write " .. filename,
		javascriptreact = "npx prettier --write " .. filename,
		typescriptreact = "npx prettier --write " .. filename,
	}

	if commands[filetype] ~= nil then
		vim.cmd("w")
		os.execute(commands[filetype])
		vim.cmd("e!")
		print(commands[filetype])
	else
		print("No command found for " .. filetype .. " file type")
	end
end

vim.keymap.set(
	"n",
	"<leader>cf",
	"<cmd>lua use_custom_formatter()<CR>",
	{ noremap = true, desc = "[C]ustom [f]ormatter" }
)

local function run_file()
	local filetype = vim.bo.filetype
	local filename = vim.api.nvim_buf_get_name(0)
	local commands = {
		typescript = "npx tsx " .. filename,
	}

	if commands[filetype] ~= nil then
		vim.cmd("w")
		os.execute(commands[filetype])
	else
		print("No command found for " .. filetype .. " file type")
	end
end

-- vim.keymap.set("n", "R", function()
-- 	run_file()
-- end, { noremap = true, silent = false })
