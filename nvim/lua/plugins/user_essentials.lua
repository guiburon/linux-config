return {
  --- line wrapping (toggle with keys: yow) ---
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end,
  },
}
