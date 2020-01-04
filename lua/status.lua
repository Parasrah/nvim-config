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
    function closure(value)
        function add(name, item)
            -- TODO: lazy evaluation
            local pre = '%#pre_'..name..'#'..left
            local main = '%#'..name..'#%'..item
            local post = '%#post_'..name..'#'..right
            return closure(value..pre..main..post)
        end

        function get()
            return value
        end

        function override(new)
            return closure(value..new)
        end

        return {
            add = add,
            get = get,
            override = override,
        }
    end
    return closure('')
end

function colors()
    return ""
end

----------------------------------
--          Status Line         --
----------------------------------

local status = create()

-- Left Side --
    .add('filename', '.20f')

-- Right Side --

----------------------------------
--           Tab Line           --
----------------------------------

-- Left Side --

-- Right Side --

return {
    get = status.get,
    colors = colors,
}
