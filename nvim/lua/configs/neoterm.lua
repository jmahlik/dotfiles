local M = {}

M.setup = function()
	vim.g.python3_host_prog = "python"
	vim.g.python_host_prog = "python"
	vim.g.neoterm_default_mod = "belowright"
	vim.g.neoterm_size = 20
	vim.g.neoterm_autoscroll = 1
	vim.g.neoterm_repl_python = { ". .venv/bin/activate && python" }
	vim.g.neoterm_shell = "bash --login"
end
return M
