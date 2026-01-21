M = {}

M.vinc = function(amount)
  vim.cmd.resize({ '+' .. tostring(amount), mods = { vertical = true } })
end

M.vdec = function(amount)
  vim.cmd.resize({ '-' .. tostring(amount), mods = { vertical = true } })
end

M.hinc = function(amount)
  vim.cmd.resize({ '+' .. tostring(amount) })
end

M.hdec = function(amount)
  vim.cmd.resize({ '-' .. tostring(amount) })
end

return M

