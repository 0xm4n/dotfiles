local dap, dapui = require("dap"), require("dapui")

require("dapui").setup({
	-- icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
	icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Use this to override mappings for specific elements
	element_mappings = {
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				{ id = "breakpoints", size = 0.15 },
				{ id = "watches",     size = 0.15 },
				{ id = "scopes",      size = 0.35 },
				{ id = "stacks",      size = 0.35 },
			},
			size = 60,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
				-- {id = "repl", size = .75 },
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	}
})

-- Open and close dap ui when we start/stop debugging
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = '/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.configurations.c = {
  {
    name = 'Attach to gdbserver',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = '172.16.80.158:444',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = '${workspaceFolder}/sysinit/init',
  }
}

require("nvim-dap-virtual-text").setup{
	all_references = false,
	highlight_changed_variables = true,
	highlight_new_as_changed = true,
}


require('telescope').load_extension('dap')


