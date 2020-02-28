require('util')()

local exports = {}

local api = vim.api

local search_groups = {
    web = {'js', 'jsx', 'ts', 'tsx', 'json', 'html', 'pug', 'scss', 'sass', 'css', 'less'},
    cs = {'cs', 'cshtml', 'csproj', 'sln'},
    rust = {'rs'},
    elm = {'elm'},
    golang = {'go'},
    elixir = {'ex', 'exs'},
    haskell = {'hs'},
}

exports.search = function (term)
    local group = pipe({
        filter(--[[ TODO: finish ]])
    })(search_groups)
    local escaped_term = api.nvim_eval('shellescape(' .. term .. ')')
    local search_path = '**/*.{' .. join(',')(search_groups.elm) ..'}'
    api.nvim_eval('grep ' .. escaped_term .. ' -g ' .. search_path)
end

return exports
