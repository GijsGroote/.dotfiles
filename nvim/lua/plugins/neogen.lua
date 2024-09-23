return {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
        input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
    
    version = "*" ,
    keys = {
        { "<leader>do", "<cmd>Neogen<CR>", desc = "make Doc String" },
    },

}
