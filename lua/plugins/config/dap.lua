local ok, dap_ui = pcall(require, "dapui")
if not ok then
    return
end

dap_ui.setup()

local ok, dap_python = pcall(require, "dap-python")
if not ok then
    return
end

dap_python.setup('~/.pyenv/versions/great_expectations_dev/bin/python')
dap_python.test_runner = 'pytest'
