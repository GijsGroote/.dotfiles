return {
	"brianhuster/autosave.nvim",
	lazy = false,
    config = function()
       require('autosave').setup({
         enabled = false,
       })
     end,
}
