--- Utilities
---
--- The following are utilities used for my neovim configuration
--- Many are either re-exports from the "fun" library or
--- abstractions around it. It uses a similar currying pattern
--- to RamdaJS

local exports = {}
local fun = require('fun')

------------------------------
--         Currying         --
------------------------------

exports.curry2 = function(fn)
    return function(a)
        return function(b)
            return fn(a, b)
        end
    end
end

------------------------------
--          Simple          --
------------------------------

exports.length = fun.length

exports.totable = fun.totable

exports.tomap = fun.tomap

exports.deep = fun.deepcopy

exports.head = fun.head

exports.nth = exports.curry2(fun.nth)

exports.take = exports.curry2(fun.take_n)

exports.drop = exports.curry2(fun.drop_n)

exports.map = exports.curry2(fun.map)

exports.filter = exports.curry2(fun.filter)

exports.intersperse = exports.curry2(fun.intersperse)

------------------------------
--          Complex         --
------------------------------

exports.reduce = function(transform)
    return function(list)
        if exports.length(list) == 0 then
            return nil
        end
        local accum = exports.pipe({
            exports.head,
            exports.deep,
        })(list)
        return fun.foldl(transform, accum, exports.drop(1)(list))
    end
end

------------------------------
--           Custom         --
------------------------------

exports.identity = function(me)
    return function()
        return me
    end
end

exports.pipe = function(transforms)
    return function(arg)
        local result = arg
        for _, t in ipairs(transforms) do
            result = t(result)
        end
        return result
    end
end

exports.shallow = function(orig)
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

exports.join = function(sep)
    return function(list)
        if exports.length(list) == 1 then
            return exports.head(list)
        end
        return exports.pipe({
            exports.intersperse(sep),
            exports.reduce(function(x, y) return x .. y end),
        })(list)
    end
end

------------------------------
--          Exports         --
------------------------------

setmetatable(exports, {
    __call = function(t, override)
        local loaded_id = 'lua_utils_loaded'
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
    end,
})

return exports
