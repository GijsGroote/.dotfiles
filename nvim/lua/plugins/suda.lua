-- Suda for super user privileges

return {
  "lambdalisue/suda.vim",
  keys = {
    { "<leader>sr", "<cmd>SudaRead<CR>", desc = "sudo read" },
    { "<leader>sw", "<cmd>SudaWrite<CR>", desc = "sudo write" },
  },
}
