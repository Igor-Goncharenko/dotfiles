return {
  "nvim-telescope/telescope.nvim",
  -- tag = "0.1.6",
  branch = "0.1.x",
  dependencies = { 
    -- To make grep work run:
    -- sudo apt install ripgrep  
    -- (worked on ubuntu 23.10)
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim"
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    
    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,  -- move to previous result
            ["<C-j>"] = actions.move_selection_next,      -- move to next result
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    nmap = function(key, cmd, desc, mode) 
      mode = mode or "n"
      vim.keymap.set(mode, key, cmd, { desc = desc })
    end

    -- <leader>f - prefix for group 'telescope' (which-key.lua)
    nmap("<leader>ff", "<cmd>Telescope find_files<CR>", "Fuzzy find files in cwd")
    nmap("<leader>fr", "<cmd>Telescope oldfiles<CR>", "Fuzzy find recent files")
    nmap("<leader>fs", "<cmd>Telescope live_grep<CR>", "Find string in cwd")
    nmap("<leader>fc", "<cmd>Telescope grep_string<CR>", "Find string under cursor in cwd")
    nmap("<leader>ft", "<cmd>TodoTelescope<CR>", "Find todos")
  end,
}
