local state = {
    win = nil,
    buf = nil
}

local open_win = function()
    -- Get the screen size (width and height of the editor window)
    local screen_width = vim.api.nvim_win_get_width(0)
    local screen_height = vim.api.nvim_win_get_height(0)

    -- Calculate 60% of the screen width and 10% of the screen height
    local width = math.floor(screen_width * 0.6)
    local height = math.floor(screen_height * 0.05)

    -- Calculate the row and column to center the window
    local row = math.floor((screen_height - height) / 2)
    local col = math.floor((screen_width - width) / 2)

    -- Create a new empty buffer
    if state.buf == nil then
        state.buf = vim.api.nvim_create_buf(false, true) -- (listed, scratch)
    end


    -- Define the window options
    local opts = {
        relative = 'editor', -- Floating window relative to the editor
        width = width,       -- 60% of screen width
        height = height,     -- 10% of screen height
        row = row,           -- Centered vertically
        col = col,           -- Centered horizontally
        style = 'minimal',   -- Minimal UI (no line numbers, etc.)
        title = "cmd",
        title_pos = "center",
        border = "rounded"
    }

    -- Open the floating window
    state.win = vim.api.nvim_open_win(state.buf, true, opts)
    vim.cmd("startinsert")
end

local close_win = function()
    vim.api.nvim_win_close(state.win, true)
    state.win = nil
end


local exec_cmd = function()
    local lines = vim.api.nvim_buf_get_lines(state.buf, 0, -1, false)
    vim.cmd(lines[1])
    vim.api.nvim_buf_set_lines(state.buf, 0, -1, false, {})
end


local toggle_win = function()
    if state.win then
        close_win()
    else
        open_win()
    end
end

vim.keymap.set("n", "<leader>pp", toggle_win)
vim.keymap.set({ "n", "i" }, "<cr>", function()
    exec_cmd()
    toggle_win()
end, { buffer = state.buf, noremap = true })

-- todo:
-- center the text in the buffer
-- make a little > on the left hand side
