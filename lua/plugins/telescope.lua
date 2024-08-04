-- require("util.plugins.telescope-bootstrap")

return {
  {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = { 
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter"
      }
  },
}
