local api = vim.api
local left = ""
local right = ""

function init()
    api.nvim_command('set statusline=""')
end

function create()
    function closure(value)
        function add(name, item)
            -- TODO: lazy evaluation
            local pre = '%#pre_'..name..'#'..left
            local main = '%#'..name..'#%'..item
            local post = '%#post_'..name..'#'..right
            return closure(value..pre..main..post)
        end

        function set()
            api.nvim_command('set statusline='..value)
        end

        return {
            add = add,
            set = set,
        }
    end
    return closure('')
end

----------------------------------
--          Status Line         --
----------------------------------

-- Left Side --

local status = create()
    .add('line', 'l')

-- Right Side --

----------------------------------
--           Tab Line           --
----------------------------------

-- Left Side --

-- Right Side --

return {
    set = status.set,
}
