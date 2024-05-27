return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    nmap = function(key, cmd, desc, mode) 
      mode = mode or "n"
      vim.keymap.set(mode, key, cmd, { desc = desc })
    end

    nmap("]t", function()
      todo_comments.jump_next()
    end, "Next todo comment")

    nmap("[t", function() 
      todo_comments.jump_prev() 
    end, "Previous todo comment")

    -- https://github.com/folke/todo-comments.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    todo_comments.setup({
      keywords = {
        TODO = { icon = "", color = "#b16286" },
        HACK = { icon = "", color = "#cc241d" },
        WARN = { icon = "", color = "#cc241d", alt = { "WARNING", "XXX" } },
        PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "", color = "#83a598", alt = { "INFO" } },
        TEST = { icon = "", color = "#d79921", alt = { "TESTING", "PASSED", "FAILED" } },
      },
  })
  end,
}
