vim.api.nvim_create_user_command('Pi', 'PackerInstall', {})
vim.api.nvim_create_user_command('Pu', 'PackerSync', {})
vim.api.nvim_create_user_command('Pc', 'PackerClean', {})
vim.api.nvim_create_user_command('Ps', 'PackerStatus', {})
vim.api.nvim_create_user_command('Pc', 'PackerCompile', {})
vim.api.nvim_create_user_command('Gr', 'GoReferrers', {})
vim.api.nvim_create_user_command('Gd', 'GoDef', {})
vim.api.nvim_create_user_command('Tr', 'terminal', {})
vim.api.nvim_create_user_command('Mp', 'MarkdownPreview', {})
vim.api.nvim_create_user_command('Tv', 'vsplit | terminal', {})
vim.api.nvim_create_user_command('Th', 'split | terminal', {})
vim.api.nvim_create_user_command('Rc', 'edit $MYVIMRC', {})
vim.api.nvim_create_user_command('Re', 'source ~/.config/nvim/init.vim', {})
vim.api.nvim_create_user_command('Nf', 'NvimTreeFindFile', {})
vim.api.nvim_create_user_command('Nt', 'NvimTreeToggle', {})
vim.api.nvim_create_user_command('St', 'SidebarNvimToggle', {})
vim.api.nvim_create_user_command('Ch', 'checkhealth', {})
vim.api.nvim_create_user_command('Mt', 'MinimapToggle', {})
vim.api.nvim_create_user_command('Tn', 'TestNearest', {})

vim.api.nvim_command('cnoreabbrev he help')
vim.api.nvim_create_user_command('Re', 'source $MYVIMRC', {})

vim.api.nvim_create_user_command('Filepath', 'echo expand("%:p")', {})

--cocdiaglus

