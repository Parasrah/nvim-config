require('util')()

local exports = {}

local lib = {
    join = {
        function(check)
            local inter = { 'b', 'b', 's' }
            local sep = 'oo'
            local result = exports.join(sep)(iter)
            check.eq(result)('booboos')
        end,
    },
}

exports.test = function()
    local lib = {}

    function mk_checker(name)
        function eq(actual, expected)
            assert(
                actual == expected,
                name .. ': check.eq(' .. actual .. ', ' .. expected .. ') failed'
            )
        end

        return {
            eq = curry2(eq)
        }
    end

    for name, suite in ipairs(tests) do
        for i, test in ipairs(suite) do
            local id = name .. '#' .. i
            local checker = mk_checker(id)
            test(checker)
            -- TODO: prevent errors from propagating
            print(id .. ' passed.')
        end
    end
end

setmetatable(exports, {
    __call = exports.test
})
