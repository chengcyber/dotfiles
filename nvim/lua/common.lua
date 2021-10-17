local api = vim.api
local M = {}

function M.get_logger(name)
  return function (msg, hl_group)
    hl_group = hl_group or 'ErrorMsg'
    api.nvim_echo(
      {
        { name, hl_group },
        { ' ' .. msg }
      },
      true,
      {}
    )
  end
end

function M.try_require(name)
    local ok, _ = pcall(require, name)
    local logger = M.get_logger('common#try_require')
    if not ok then
      logger('failed to require ' .. name)
    end
end

return M