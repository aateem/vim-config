-- TODO Update this when autocmd functionality will be added
-- into neovim standard library

-- local autocommands = { test = 'test',
--     -- in combination with:
--     -- vim.opt.number == true && vim.opt.relativenumber == true
--     -- this autocmd also enables the behavior where
--     -- buffer with lost focus is switched to the
--     -- absolute line numbers;
--     -- I find this presentation very useful as
--     -- it easier to track my position in those
--     -- buffers
--     numberToggle = {
--         [[ BufEnter,FocusGained * set relativenumber ]],
--         [[ BufLeave,FocusLost   * set norelativenumber ]],
--     },

--     -- trim trailing whitespaces on buffer's write
--     trimWhitespaces = {
--         [[ BufWritePre * :%s/\s\+$//e ]],
--     },

-- }

-- local add_autocmd = function (param)
--     local result = {}
--     print('here')
--     print(param)
--     for name, specifiers in ipairs(param) do
--         print(name)
--         local _autocmd_list = {}
--         for _, line in ipairs(specifiers) do
--             table.insert(_autocmd_list, "autocmd" .. line)
--         end

--         local _autocmd = string.format(
--             [[
--                 augroup %s
--                     autocmd!
--                     %s
--                 augroup END
--             ]],
--             name,
--             table.concat(_autocmd_list, '\n')
--         )
--         table.insert(result, _autocmd)
--         -- table.insert(result, name)
--     end
--     return result
-- end

-- local M = {}

-- function M.list_autocmds()
--     print(unpack(autocommands.numberToggle))
--     print('started')
--     add_autocmd(autocommands)
--     print('finished')
--     end

-- function M.hello_world()
--     print('Hello worlds!!!')
-- end
-- return M

vim.api.nvim_exec(
            [[
                augroup numberToggle
                    autocmd!
                    autocmd  BufEnter,FocusGained * set relativenumber
                    autocmd  BufLeave,FocusLost   * set norelativenumber
                augroup END
            ]], true)

vim.api.nvim_exec(
            [[
                augroup trimeWhiteSpaces
                    autocmd!
                    autocmd  BufWritePre * :%s/\s\+$//e
                augroup END
            ]], true)
