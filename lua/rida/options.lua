vim.opt.swapfile = false

local indent_width = 4
vim.opt.tabstop = indent_width
vim.opt.shiftwidth = indent_width

function set_indent_style()
    local exp = true
    local filetype = vim.bo.filetype
    if filetype == "go" or filetype == "make" then
        exp = false
    end
    vim.opt.expandtab = exp
end

vim.api.nvim_create_autocmd(
    "BufReadPost",
    { command = ":lua set_indent_style()" }
)

vim.opt.listchars.trail = "*"
vim.opt.listchars.tab = ">"
vim.opt.list = true

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.wrap = false

