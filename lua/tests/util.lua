require'util'()

local ex = {}

function ex.map(check)

end

function ex.zip(check)

end

function ex.length(check)
    local input = {
        {0, 1, 2, -1},
        {first = '1', second = '2'},
    }

    local expected = {4, 2}
    local actual = map(length)(input)

    foreach(check.eq)(zip(expected, actual))
end

function ex.pipe(check)

end

function ex.join_tables(check)

end

function ex.join_strings(check)

end

setmetatable(ex, {
    __call = create_test('util', ex)
})

return ex
