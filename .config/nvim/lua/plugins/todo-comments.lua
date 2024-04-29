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

    todo_comments.setup()
  end,
}
