-- Visualise Markdown files
-- TODO: REPLACE WITH SOMETHING THAT CAN BE VISUALIZED WHILST EDITING

return {
    "ellisonleao/glow.nvim",
    config = true,
    keys = {
      {"<leader>md", ":Glow<CR>", desc = "View Markdown File"}
    },
}
