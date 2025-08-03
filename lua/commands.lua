vim.api.nvim_create_user_command(
    "Mkscratch",
    function()
	local buf = -1 

	if buf == -1 then
	    buf = vim.api.nvim_create_buf(false, true)
	else
	    vim.notify("reuse existing scratch.")
	end

	vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), buf)
    end,
    {}
)
