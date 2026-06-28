return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  keys = {
      -- { ";", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
      { "<C-S-j>", function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.api.nvim_buf_get_name(buf):match("claude") then
            vim.api.nvim_set_current_win(win)
            vim.cmd("startinsert")
            return
          end
        end
        vim.cmd("ClaudeCode")
      end, desc = "Toggle/Focus Claude Code" },
  },
  config = function()
    require("claude-code").setup({
      keymaps = {
        window_navigation = false,
      },
    })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*claude*",
      callback = function()
        vim.opt_local.timeoutlen = 0
        vim.keymap.set("t", "<C-S-k>", "<C-\\><C-n><C-w>p", { buffer = true, desc = "Back to editor" })
      end,
    })

  end
}
