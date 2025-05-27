return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "                                                    ",
      "  ÔûêÔûêÔòù  ÔûêÔûêÔòùÔûêÔûêÔòù  ÔûêÔûêÔòù ÔûêÔûêÔûêÔûêÔûêÔòù ÔûêÔûêÔòù      ÔûêÔûêÔûêÔûêÔûêÔòù ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔòù  ",
      "  ÔûêÔûêÔòæ ÔûêÔûêÔòöÔòØÔûêÔûêÔòæ  ÔûêÔûêÔòæÔûêÔûêÔòöÔòÉÔòÉÔûêÔûêÔòùÔûêÔûêÔòæ     ÔûêÔûêÔòöÔòÉÔòÉÔûêÔûêÔòùÔûêÔûêÔòöÔòÉÔòÉÔòÉÔòÉÔòØ  ",
      "  ÔûêÔûêÔûêÔûêÔûêÔòöÔòØ ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔòæÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔòæÔûêÔûêÔòæ     ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔòæÔûêÔûêÔûêÔûêÔûêÔòù    ",
      "  ÔûêÔûêÔòöÔòÉÔûêÔûêÔòù ÔûêÔûêÔòöÔòÉÔòÉÔûêÔûêÔòæÔûêÔûêÔòöÔòÉÔòÉÔûêÔûêÔòæÔûêÔûêÔòæ     ÔûêÔûêÔòöÔòÉÔòÉÔûêÔûêÔòæÔûêÔûêÔòöÔòÉÔòÉÔòØ    ",
      "  ÔûêÔûêÔòæ  ÔûêÔûêÔòùÔûêÔûêÔòæ  ÔûêÔûêÔòæÔûêÔûêÔòæ  ÔûêÔûêÔòæÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔòùÔûêÔûêÔòæ  ÔûêÔûêÔòæÔûêÔûêÔòæ       ",
      "  ÔòÜÔòÉÔòØ  ÔòÜÔòÉÔòØÔòÜÔòÉÔòØ  ÔòÜÔòÉÔòØÔòÜÔòÉÔòØ  ÔòÜÔòÉÔòØÔòÜÔòÉÔòÉÔòÉÔòÉÔòÉÔòÉÔòØÔòÜÔòÉÔòØ  ÔòÜÔòÉÔòØÔòÜÔòÉÔòØ       ",
      "                                                    ",
    }

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find Text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
  dashboard.button("p", "  Manage Plugins", ":Lazy <CR>"),
  dashboard.button("n", "  File Explorer", ":Neotree toggle <CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

local function footer()
      local total_plugins = #vim.tbl_keys(require("lazy").plugins())
      local version = vim.version()
      local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
      return " " .. total_plugins .. " plugins" .. nvim_version_info
    end

    dashboard.section.footer.val = footer()

    -- Layout
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.section.footer.opts.hl = "Type"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    -- Auto comando para abrir o Alpha ao iniciar o Neovim (sem arquivos)
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local should_skip = false
        -- Skip if: argument count > 0
        if vim.fn.argc() > 0 then
          should_skip = true
        -- Skip if: entering a session file
        elseif vim.fn.line2byte("$") ~= -1 then
          should_skip = true
        -- Skip if: Neovim started with a directory argument
        elseif vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
          should_skip = true
        end

        if not should_skip then
          require("alpha").start(true)
        end
      end,
    })
  end,
}
