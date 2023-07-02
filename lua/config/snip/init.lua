local M = {}

local snippets_folder = vim.fn.stdpath "config" .. "/lua/config/snip/snippets/"
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets("all", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	})
})

function _G.edit_ft()
  -- returns table like {"lua", "all"}
  local fts = require("luasnip.util.util").get_snippet_filetypes()
  vim.ui.select(fts, {
    prompt = "Select which filetype to edit:",
  }, function(item, idx)
    -- selection aborted -> idx == nil
    if idx then
      vim.cmd("edit " .. snippets_folder .. item .. ".lua")
    end
  end)
end

function _G.snippets_clear()
  for m, _ in pairs(ls.snippets) do
    package.loaded["config.snip.snippets." .. m] = nil
  end
  ls.snippets = setmetatable({}, {
    __index = function(t, k)
      local ok, m = pcall(require, "config.snip.snippets." .. k)
      if not ok and not string.match(m, "^module.*not found:") then
        error(m)
      end
      t[k] = ok and m or {}

      -- optionally load snippets from vscode- or snipmate-library:
      --
      -- require("luasnip.loaders.from_vscode").load({include={k}})
      -- require("luasnip.loaders.from_snipmate").load({include={k}})
      return t[k]
    end,
  })
end

local types = require "luasnip.util.types"

function M.setup()
  ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,

    -- ext_opts = {
    --   [types.choiceNode] = {
    --     active = {
    --       virt_text = { { "<-", "Error" } },
    --     },
    --   },
    -- },
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "●", "GruvboxOrange" } },
        },
      },
      [types.insertNode] = {
        active = {
          virt_text = { { "●", "GruvboxBlue" } },
        },
      },
    },
  }

  _G.snippets_clear()

  local snip_cmd = string.format(
    [[
    augroup snippets_clear
    au!
    au BufWritePost %s lua _G.snippets_clear()
    augroup END
  ]],
    snippets_folder .. "*.lua"
  )

  vim.cmd(snip_cmd)
  vim.cmd [[command! LuaSnipEdit :lua _G.edit_ft()]]

  -- Lazy load snippets
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_snipmate").lazy_load()

  -- Load custom typescript snippets
  require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/typescript" } }
  require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/python" } }
  require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/rust" } }

  ls.filetype_extend("all", { "_" })
end

-- local function create_snippets()
--   ls.snippets = {
--     all = {
--       s("ttt", t "Testing Luasnip"),
--     },
--     lua = require("config.snip.snippets.lua").setup(),
--     python = require("config.snip.snippets.python").setup(),
--   }
-- end

return M
