return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- 这将显示所有隐藏文件
          hide_dotfiles = false, -- 这将显示以点开头的文件
          hide_gitignored = false, -- 如果您也想显示 .gitignore 中的文件
        },
      },
    },
  },
  -- 禁用codeium
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufEnter",
  --
  --   config = function()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<c-;>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<c-,>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<c-x>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true, silent = true })
  --   end,
  -- },
  -- fittencode
  {
    "luozhiya/fittencode.nvim",
    config = function()
      require("fittencode").setup({
        inline_completion = {
          enable = true,
          disable_completion_within_the_line = false,
          disable_completion_when_delete = false,
          auto_triggering_completion = true,
        },
      })
      vim.keymap.set("i", "<C-g>", function()
        return require("fittencode").accept_line()
      end, { expr = true, silent = true })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vue", "javascript", "css", "scss" })
      end
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          filetypes = { "javascript", "javascriptreact", "vue", "json" },
          settings = {
            volar = {
              completion = {
                autoImport = true,
                useScaffoldSnippets = true,
              },
              codeLens = {
                references = true,
                pugTools = true,
                scriptSetupTools = true,
              },
            },
          },
          root_dir = require("lspconfig.util").root_pattern("package.json", "vue.config.js", ".git", "jsconfig.json"),
        },
        -- 禁用vue2 lsp
        vuels = false,
        -- 禁用ts lsp
        ts_ls = {
          autostart = false,
          enable = false,
        },
        -- 禁用ts lsp
        vtsls = {
          autostart = false,
          enable = false,
        },
      },
    },
  },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
}
