
return {
  -- absolute and relative line numbering
  -- TODO

  -- Better Comment
{ 'echasnovski/mini.comment', version = '*',
    config = function()
        require('mini.comment').setup() 
    end,
},

  -- IndentLine
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
  },
}
