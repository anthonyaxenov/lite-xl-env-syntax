-- mod-version:2

-- Anthony Axenov (c) 2022, The MIT License
-- https://github.com/anthonyaxenov/lite-xl-env-syntax

local syntax = require "core.syntax"

syntax.add {
  name = "language_env",
  files = { "%.env$" },
  comment = '#',
  symbols = {},
  patterns = {
    {type = "comment" , pattern = "#.*$"},
    {type = "function", pattern = "export"},
    {type = "literal",  pattern = "[Nn][Uu][Ll][Ll]%s*"}, -- null
    {type = "literal",  pattern = "[Tt][Rr][Uu][Ee]%s*"}, -- true
    {type = "literal",  pattern = "[Ff][Aa][Ll][Ss][Ee]%s*"}, -- false
    {type = "literal",  pattern = "\\[nrtfb\\\"']"}, -- escaped chars
    {type = "literal",  pattern = "'\\u%x%x%x%x'"}, -- unicode sequence

    -- quoted strings
    {type = "string",   pattern = {'"', '"', '\\'}},
    {type = "string",   pattern = {"'", "'", '\\'}},
    {type = "string",   pattern = {'"""', '"""', '\\'}},
    {type = "string",   pattern = {"'''", "'''", '\\'}},

    -- numbers
    {type = "number",   pattern = "0[bB][%d]+"},
    {type = "number",   pattern = "0[xX][%da-fA-F]+"},
    {type = "number",   pattern = "[-+]?%.?%d+"},

    { -- keys
      pattern = "[a-zA-Z_]+[a-zA-Z%d_]+()%s*=%s*",
      type = { "keyword2", "operator" },
    },

    { -- interpolated var
      pattern = "%${()[a-zA-Z_]+[a-zA-Z%d_]+()}",
      type = {"keyword", "keyword2", "keyword"},
    },
  },
}
