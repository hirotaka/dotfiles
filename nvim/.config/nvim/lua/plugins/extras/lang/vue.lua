return {
  {
    "catgoose/vue-goto-definition.nvim",
    event = "BufReadPre",
    opts = {
      filters = {
        auto_imports = true,
        auto_components = true,
        same_file = true,
        declaration = true,
      },
      filetypes = { "vue", "typescript" },
      detection = {
        nuxt = function()
          return vim.fn.glob(".nuxt/") ~= ""
        end,
        vue3 = function()
          return vim.fn.filereadable("vite.config.ts") == 1 or vim.fn.filereadable("src/App.vue") == 1
        end,
        priority = { "nuxt", "vue3" },
      },
      lsp = {
        override_definition = true, -- override vim.lsp.buf.definition
      },
      debounce = 200,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "vue",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- take over for 1.8.27
      servers = {
        volar = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        },
      },
      -- for 2.0
      -- setup = {
      --   tsserver = function(_, opts)
      --     local mason_registry = require("mason-registry")
      --     local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
      --       .. "/node_modules/@vue/language-server"
      --
      --     opts.init_options = {
      --       plugins = {
      --         {
      --           name = "@vue/typescript-plugin",
      --           location = vue_language_server_path,
      --           languages = { "vue", "typescript" },
      --         },
      --       },
      --     }
      --     opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
      --   end,
      -- },
      -- disble hypermode for 2.0.7
      -- servers = {
      --   volar = {
      --     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      --     init_options = {
      --       vue = {
      --         takeover = true,
      --         hyperMode = false,
      --       },
      --     },
      --   },
      -- },
      -- enable hypermode for 2.0.7
      -- servers = {
      -- volar = {},
      -- tsserver = {},
      -- },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {
          vitestCommand = "yarn test --",
        },
      },
    },
  },
}
