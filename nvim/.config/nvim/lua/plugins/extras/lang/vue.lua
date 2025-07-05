local vue_language_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
-- log it in a notification for testing
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
  enableForWorkspaceTypeScriptVersions = true,
}

return {
  -- recommended = function()
  --   return LazyVim.extras.wants({
  --     ft = "vue",
  --     root = { "vue.config.js" },
  --   })
  -- end,
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "vue", "css" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          on_init = function(client)
            client.handlers["tsserver/request"] = function(_, result, context)
              local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
              if #clients == 0 then
                vim.notify(
                  "Could not found `vtsls` lsp client, vue_lsp would not work without it.",
                  vim.log.levels.ERROR
                )
                return
              end
              local ts_client = clients[1]

              local param = unpack(result)
              local id, command, payload = unpack(param)
              ts_client:exec_cmd({
                title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
                command = "typescript.tsserverRequest",
                arguments = {
                  command,
                  payload,
                },
              }, { bufnr = context.bufnr }, function(_, r)
                local response_data = { { id, r.body } }
                ---@diagnostic disable-next-line: param-type-mismatch
                client:notify("tsserver/response", response_data)
              end)
            end
          end,
        },
        vtsls = {},
      },
    },
  },
  -- Add LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      table.insert(opts.servers.vtsls.filetypes, "vue")
      LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
        {
          name = "@vue/typescript-plugin",
          location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
          languages = { "vue" },
          configNamespace = "typescript",
          enableForWorkspaceTypeScriptVersions = true,
        },
      })
    end,
  },
}
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = function(_, opts)
--       vim.list_extend(opts.ensure_installed, {
--         "vue",
--       })
--     end,
--   },
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       -- take over for 1.8.27
--       servers = {
--         volar = {
--           filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
--         },
--       },
--       -- for 2.0
--       -- setup = {
--       --   tsserver = function(_, opts)
--       --     local mason_registry = require("mason-registry")
--       --     local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
--       --       .. "/node_modules/@vue/language-server"
--       --
--       --     opts.init_options = {
--       --       plugins = {
--       --         {
--       --           name = "@vue/typescript-plugin",
--       --           location = vue_language_server_path,
--       --           languages = { "vue", "typescript" },
--       --         },
--       --       },
--       --     }
--       --     opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
--       --   end,
--       -- },
--       -- disble hypermode for 2.0.7
--       -- servers = {
--       --   volar = {
--       --     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
--       --     init_options = {
--       --       vue = {
--       --         takeover = true,
--       --         hyperMode = false,
--       --       },
--       --     },
--       --   },
--       -- },
--       -- enable hypermode for 2.0.7
--       -- servers = {
--       -- volar = {},
--       -- tsserver = {},
--       -- },
--     },
--   },
--   {
--     "nvim-neotest/neotest",
--     optional = true,
--     dependencies = {
--       "marilari88/neotest-vitest",
--     },
--     opts = {
--       adapters = {
--         ["neotest-vitest"] = {
--           vitestCommand = "yarn test --",
--         },
--       },
--     },
--   },
--   -- {
--   --   "catgoose/vue-goto-definition.nvim",
--   --   event = "BufReadPre",
--   --   opts = {
--   --     filters = {
--   --       auto_imports = true,
--   --       auto_components = true,
--   --       same_file = true,
--   --       declaration = true,
--   --     },
--   --     filetypes = { "vue", "typescript" },
--   --     detection = {
--   --       nuxt = function()
--   --         return vim.fn.glob(".nuxt/") ~= ""
--   --       end,
--   --       vue3 = function()
--   --         return vim.fn.filereadable("vite.config.ts") == 1 or vim.fn.filereadable("src/App.vue") == 1
--   --       end,
--   --       priority = { "nuxt", "vue3" },
--   --     },
--   --     lsp = {
--   --       override_definition = true, -- override vim.lsp.buf.definition
--   --     },
--   --     debounce = 200,
--   --   },
--   -- },
-- }
