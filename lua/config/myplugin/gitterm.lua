local M = {}

local state = {
	winnr = -1,
	bufnr = -1
}

M.toggle_win = function()
	if vim.api.nvim_buf_is_valid(state.bufnr) and not vim.api.nvim_win_is_valid(state.winnr) then
		M.open_win()
	elseif not vim.api.nvim_win_is_valid(state.winnr) and not vim.api.nvim_win_is_valid(state.bufnr) then
		M.create_win()
	elseif vim.api.nvim_win_is_valid(state.winnr) then
		M.close_win()
	end
end

M.open_win = function()
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local opts = {
		relative = 'editor',
		width = width,
		height = height,
		row = row,
		col = col,
		border = 'rounded',
		style = 'minimal',
	}

	local winnr = vim.api.nvim_open_win(state.bufnr, true, opts)
	state.winnr = winnr
end

M.create_win = function()
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local opts = {
		relative = 'editor',
		width = width,
		height = height,
		row = row,
		col = col,
		border = 'rounded',
		style = 'minimal',
	}

	local bufnr = vim.api.nvim_create_buf(false, true)
	local winnr = vim.api.nvim_open_win(bufnr, true, opts)

	state = { winnr = winnr, bufnr = bufnr }
end

M.close_win = function()
	vim.api.nvim_win_hide(state.winnr)
	state.winnr = -1
end


M.setup = function()
	vim.keymap.set("n", "<leader>gt", M.toggle_win)
end

return M
