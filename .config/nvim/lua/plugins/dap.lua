return {
	{
		"mfussenegger/nvim-dap",
		event = {'CmdlineEnter'},
		cmd = { 'DebugStart', 'DebugContinue' },
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			require("dapui").setup({
				icons = {
					expanded = "▾",
					collapsed = "▸",
					current_frame = "▸"
				},
				mappings = {
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					edit = "e",
					repl = "r",
					toggle = "t",
				},
				element_mappings = {
				},
				expand_lines = vim.fn.has("nvim-0.7") == 1,
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
						},
						size = 0.25,
						position = "bottom",
					},
				},
				controls = {
					enabled = true,
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
					max_height = nil,
					max_width = nil,
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				windows = { indent = 1 },
				render = {
					max_type_length = nil,
					max_value_lines = 100,
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
			    -- miDebuggerServerAddress = '172.16.80.156:444',
			    -- miDebuggerServerAddress = '172.16.80.157:444',
			    -- miDebuggerServerAddress = '10.59.67.108:444',
			    -- miDebuggerServerAddress = '172.18.20.35:444',
			    -- miDebuggerServerAddress = '172.16.80.158:444',
			    -- miDebuggerServerAddress = '172.16.80.159:444',
			    -- miDebuggerServerAddress = '10.59.67.131:444',
			    miDebuggerServerAddress = '172.18.20.209:444',
			    -- miDebuggerServerAddress = '172.18.201.79:444',
			    miDebuggerPath = '/usr/bin/gdb',
			    cwd = '${workspaceFolder}',
			    program = '${workspaceFolder}/sysinit/init',
			  }
			}

			require("nvim-dap-virtual-text").setup{
				all_references = false,
				highlight_changed_variables = true,
				highlight_new_as_changed = true,
				clear_on_continue = true,
			}
		end,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		}
	},
}

