local M = {}

local h = require("smooth-resize.helper")

local map = vim.keymap.set

local mappings = {
	["<"] = { desc = "Decrease current window width by", fn = h.vdec },
	[">"] = { desc = "Increase current window width by", fn = h.vinc },
	["+"] = { desc = "Increase current window height by", fn = h.hinc },
	["-"] = { desc = "Decrease current window height by", fn = h.hdec },
}

local function get_lhs(c)
	return "<C-w>" .. c
end



local ns = vim.api.nvim_create_namespace("smooth_resize_listener")

local listener = function(key, typed)
  typed = typed or key
  local decoded = vim.fn.keytrans(typed)


  if not vim.tbl_contains({">", "<lt>", "-", "+"}, decoded) then
    M.disable()
  end
end

local wrap = function(fn, amount)
  return function ()
    fn(amount)
  end
end


local enabled = false
local user_mappings = {}

M.enable = function(inital, amount)
	enabled = true
  user_mappings = {}


	for k, v in pairs(mappings) do
		local wrapped = wrap(v.fn, amount)
		if k == inital then
			wrapped()
		end
     
		-- Store user mappings
		user_mappings[k] = vim.deepcopy(vim.fn.maparg(k, "", false, true))

		map("", k, wrapped, {
			desc = v.desc,
      noremap = true,
      silent = true,
		})
	end

  vim.on_key(listener, ns)
end

M.disable = function()
	for k, _ in pairs(mappings) do
		local m = user_mappings[k]
    vim.keymap.del("", k)
		if not vim.tbl_isempty(m) then
      vim.fn.mapset("", false, m)
		end
	end
	enabled = false
  vim.on_key(nil, ns)
end

M.setup = function(opts)
  opts = opts or {}

  local fts = opts.disabled_fts or {}

	for k, v in pairs(mappings) do
		map("", get_lhs(k), function()
			if not enabled and not vim.tbl_contains(fts, vim.bo.filetype) then
				M.enable(k, vim.v.count1)
      else
        v.fn(vim.v.count1)
			end
		end)
	end
end

return M
