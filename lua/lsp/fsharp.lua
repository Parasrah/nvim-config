local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'
local lsp = require 'nvim_lsp'

configs.fsharp = {
    default_config = {
        cmd = {
            "dotnet",
            "/home/brad/Downloads/fsautocomplete.netcore/fsautocomplete.dll",
            "--background-service-enabled"
        };
        filetypes = {"fsharp"};
        root_dir = util.root_pattern("*.fsproj");
    };
    docs = {
        vscode = "TODO";
        package_json = "TODO";
        description = [[
https://github.com/fsharp/FsAutoComplete

FsAutoComplete, a language server for F#
        ]];
    };
}
