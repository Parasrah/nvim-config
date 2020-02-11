require('util')()

-- based on https://github.com/elenapan/dotfiles/blob/master/config/nvim/statusline.vim

local api = vim.api
local left = ""
local right = ""
local file_symbol = ""

-- TODO: ensure recursion == tail end calls

----------------------------------
--             Util             --
----------------------------------

function color_name(name)
    return 'LuaStatus_' .. name
end

function create()
    function closure(status, colors, last_name)
        local c = {}
        c.override = function(value)
            function update()
                return status() .. value
            end
            return closure(update, colors, last_name)
        end

        c.add = function(name, value)
            function update()
                return status() .. '%#' .. color_name(name) .. '#' .. value
            end
            return closure(update, colors, name)
        end

        c.again = function(value)
            return c.add(last_name, value)
        end

        c.add_padding = function()
            function update()
                return status() .. '\\'
            end
            return closure(update, colors, last_name)
        end

        c.add_left = function(name)
            return c.add(name, left, last_name)
        end

        c.add_right = function(name)
            return c.add(name, right, last_name)
        end

        c.color = function(cterm, ctermfg, ctermbg)
            function update()
                local cmd = join('')({
                    'hi ',
                    color_name(last_name),
                    'cterm=',
                    cterm,
                    ' ctermfg=',
                    ctermfg,
                    ' ctermbg=',
                    ctermbg
                })
                api.nvim_command(cmd)
            end
            return closure(status, update, last_name)
        end

        c.build = function()
            return {
                get = status,
                apply_colors = colors,
            }
        end

        return c
    end

    local empty = identity('')
    return closure(empty, empty, '')
end

function modified_symbol()
    -- TODO: finish
    return '●'
end

----------------------------------
--          Status Line         --
----------------------------------

return create()

-- Left Side --

    .add_left('accent')
    .add('accent_body', file_symbol)
    .add_padding()
    .add('filename', '\\ %.20f')
    .add_right('separator')
    .color('none', '0', 'none')
    .add_padding()
    .add_left('modified')
    .color('none', '0', 'none')
    .add('modified_body', modified_symbol())
    .add_right('modified')

-- Right Side --

    .override('%=')
    .add_left('line_col')
    .add('line_col_body', '%2l\\/')
    .again('%2c')
    .add_right('line_col')
    .add_padding()

-- " Line and Column
-- set statusline+=%#MyStatuslineLineCol#
-- set statusline+=%#MyStatuslineLineColBody#%2l
-- set statusline+=\/%#MyStatuslineLineColBody#%2c
-- set statusline+=%#MyStatuslineLineCol#
-- " Padding
-- set statusline+=\ 
-- " Current scroll percentage and total lines of the file
-- set statusline+=%#MyStatuslinePercentage#
-- set statusline+=%#MyStatuslinePercentageBody#%P
-- set statusline+=\/\%#MyStatuslinePercentageBody#%L
-- set statusline+=%#MyStatuslinePercentage#
-- " Padding
-- set statusline+=\ 
-- " Filetype
-- set statusline+=%#MyStatuslineFiletype#
-- set statusline+=%#MyStatuslineFiletypeBody#%{SetFiletype(&filetype)}
-- set statusline+=%#MyStatuslineFiletype#
----------------------------------
--           Tab Line           --
----------------------------------

-- Left Side --

-- Right Side --

    .build()
