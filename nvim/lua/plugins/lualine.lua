return {
  "nvim-lualine/lualine.nvim",
  depends = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options ={
        theme = "auto",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "diagnostics" },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      }
    }),
  end
}
