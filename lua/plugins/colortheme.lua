-- return {"navarasu/onedark.nvim", opts = {}}

return {
 'ribru17/bamboo.nvim',
  config = function()
     require('bamboo').setup({})
     require('bamboo').load()
   end,
}



