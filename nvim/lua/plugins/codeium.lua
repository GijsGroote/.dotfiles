-- local opts = { mode = "i", expr = true, silent = true }
return {
  'Exafunction/codeium.vim',
  config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
}



-- keys = {
--         { "<C-g>", function() return vim.fn['codeium#Accept']() end, opts, desc = "Codeium accept suggestion" },
--         { "<c-;>", function() return vim.fn end, opts, desc = "Codeium cycle forward" },
--         { "<c-,>", function() return vim.fn['codeium#CycleCompletions'](-1) end, opts, desc = "Codeium cycle backward" },
--         { "<c-x>", function() return vim.fn['codeium#Clear']() end, opts, desc = "Codeium clear suggestion" },
--     }
