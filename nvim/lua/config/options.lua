local options = {
    filetype = "on",
    backup = false,
    clipboard = "unnamed",
    cmdheight = 2,
    completeopt = { "menu","menuone", "noinsert" },
    conceallevel = 0,
    fileencoding = "utf-8",
    hidden = true,
    hlsearch = false,
    ignorecase = true,
    pumheight = 10,
    showmode = false,
    showtabline = 1,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = true,
    scrolloff = 8,
    sidescrolloff = 8,
    guifont = "monospace:h17",
    background = "dark",
    mouse = ""
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end
vim.cmd "hi Normal guibg=NONE ctermbg=None"
