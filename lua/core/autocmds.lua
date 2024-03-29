local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

function autocmd.load_autocmds()
  local definitions = {
    yank = {
      {"TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]};
    },
    tracker = {
      {"VimEnter", [[* redir >> ~/.config/nvim/tracker.txt | silent echo "ENTER |" expand('%:p') "|" strftime("%Y-%m-%d %H:%M:%S") | redir END ]] };
      {"VimLeave", [[* redir >> ~/.config/nvim/tracker.txt | silent echo "EXIT |" expand('%:p') "|" strftime("%Y-%m-%d %H:%M:%S") | redir END ]] };
    }
  }

  autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
