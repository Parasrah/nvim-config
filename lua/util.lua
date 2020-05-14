--- Utilities ---

local ex = {}

------------------------------
--         currying         --
------------------------------

function ex.curry2(fn)
    return function(a)
        return function(b)
            return fn(a, b)
        end
    end
end

------------------------------
--        re-exports        --
------------------------------

ex.deepcopy = vim.deepcopy

------------------------------
--        functional        --
------------------------------

function ex.split()

end

function ex.min(a)
    return function(b)
        if a < b then
            return a
        else
            return b
        end
    end
end

function ex.max(a)
    return function(b)
        if a > b then
            return a
        else
            return b
        end
    end
end

function ex.zip(a)
    return function(b)
        local keys = {}

    end
end

function ex.unique(list)
    local rtn = {}
end

function ex.map(transform)
    return function(tbl)
        local mapped = {}
        for k, v in pairs(tbl) do
            mapped.k = transform(ex.deepcopy(v))
        end
    end
end

function ex.foreach(fn)
    return function(tbl)
        for _, v in pairs(tbl) do
            fn(v)
        end
    end
end

function ex.length(input)
    local input_type = type(input)
    if input_type == 'string' then
        return string.len(input)
    elseif input_type == 'table' then
    else

    end
end

function ex.reduce(transform)
    return function(list)
        if ex.length(list) == 0 then
            return nil
        end
        local accum = ex.pipe({
            ex.head,
            ex.deep,
        })(list)
        return fun.foldl(transform, accum, ex.drop(1)(list))
    end
end

function ex.identity(me)
    return function()
        return me
    end
end

function ex.pipe(transforms)
    return function(arg)
        local result = arg
        for _, t in ipairs(transforms) do
            result = t(result)
        end
        return result
    end
end

function ex.shallow(orig)
    -- from http://lua-users.org/wiki/CopyTable
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function ex.join(sep)
    return function(list)
        if ex.length(list) == 1 then
            return ex.head(list)
        end
        return ex.pipe({
            ex.intersperse(sep),
            ex.reduce(function(x, y) return x .. y end),
        })(list)
    end
end

------------------------------
--          testing         --
------------------------------

function ex.checker(mod)
    return function(name)
        local check = {}

        function check.eq(actual, expected)
            local msg = mod .. ':test_' .. name .. 'eq(' .. actual .. ',' .. expected .. ') failed'
            assert(actual == expected, msg)
        end

        return check
    end
end

function ex.create_test(name, ex)
    return function()
        local mod_checker = checker('util')
        for k, v in pairs(ex) do
            v(mod_checker(k))
        end
    end
end

------------------------------
--          general         --
------------------------------

function ex.export_call(name)
    return function(t, override)
        local loaded_id = 'lua_' .. name .. '_loaded'
        local api = vim.api
        if api.nvim_eval('exists("g:' .. loaded_id .. '")') == 0 then
            api.nvim_set_var(loaded_id, 1)
        else
            return
        end
        for k, v in pairs(t) do
            if rawget(_G, k) ~= nil then
                local msg = 'function ' .. k .. ' already exists in global scope.'
                if override then
                    rawset(_G, k, v)
                    print('WARNING: ' .. msg .. ' Overwritten.')
                else
                    print('NOTICE: ' .. msg .. ' Skipped.')
                end
            else
                rawset(_G, k, v)
            end
        end
    end
end

function ex.find_workspace(indicators)
    local cwd = api.nvim_command('pwd')
    local root_indicators = {'/', 'C:\\'}

    function find_workspace(dir)
        local file_str = api.nvim_command('globpath(' .. dir .. ')')
        local files = ex.split('\n')

        return find_workspace(dir)
    end

    return find_workspace(cwd)
end

------------------------------
--          exports         --
------------------------------

setmetatable(ex, {
    __call = ex.export_call('util')
})

return ex
