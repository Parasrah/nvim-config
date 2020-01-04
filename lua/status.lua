require 'util'()
local api = vim.api
-- local left = ""
-- local right = ""
local left = ""
local right = ""
local something = ""

----------------------------------
--             Util             --
----------------------------------

function create()
    function closure(status, colors)
        function add(name, items)
            -- TODO: lazy evaluation
            function updated()
                local pre = '%#pre_'..name..'#'..left
                local main = pipe({
                    map(function(x) return '%#' .. x .. '#%' end),
                    join('\\/'),
                })(items)
                local post = '%#post_'..name..'#'..right
                return status()..pre..main..post
            end
            return closure(updated, colors)
        end

        function override(new)
            return closure(value..new)
        end

        return {
            add = add,
            value = status,
            colors = colors,
            override = override,
        }
    end

    function empty()
        return ''
    end
    return closure(empty, empty)
end

----------------------------------
--          Status Line         --
----------------------------------

local status = create()

-- Left Side --
    -- .add('filename', '.20f')

-- Right Side --

----------------------------------
--           Tab Line           --
----------------------------------

-- Left Side --

-- Right Side --

return {
    get = status.value,
    colors = status.colors,
}
