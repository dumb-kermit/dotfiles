local autocmd = vim.api.nvim_create_autocmd

-- dynamic kitty padding --
--autocmd("VimEnter", {
--  command = ":silent !kitty @ set-spacing padding=0 margin=0",
--})

--autocmd("VimLeavePre", {
--  command = ":silent !kitty @ set-spacing padding=20 margin=10",
--})

-- restore cursor position --
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

autocmd("FileType", {
  pattern = { "nvdash", "alpha", "dashboard", "neo-tree", "nvcheatsheet", "lazy", "mason" },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

autocmd("BufWritePost", {
  pattern = vim.tbl_map(function(path)
    return vim.fs.normalize(vim.loop.fs_realpath(path))
  end, vim.fn.glob(vim.fn.stdpath "config" .. "/lua/**/*.lua", true, true, true)),
  group = vim.api.nvim_create_augroup("ReloadNvChad", {}),

  callback = function(opts)
    local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
    local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
    local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

    require("plenary.reload").reload_module "nvconfig"
    require("plenary.reload").reload_module "chadrc"
    require("plenary.reload").reload_module "base46"
    require("plenary.reload").reload_module(module)

    local config = require "nvconfig"

    -- statusline
    require("plenary.reload").reload_module "nvchad.stl.utils"
    require("plenary.reload").reload_module("nvchad.stl." .. config.ui.statusline.theme)
    vim.opt.statusline = "%!v:lua.require('nvchad.stl." .. config.ui.statusline.theme .. "')()"

    -- tabufline
    if config.ui.tabufline.enabled then
      require("plenary.reload").reload_module "nvchad.tabufline.modules"
      vim.opt.tabline = "%!v:lua.require('nvchad.tabufline.modules')()"
    end

    require("base46").load_all_highlights()
    -- vim.cmd("redraw!")
  end,
})

autocmd('User', {
  pattern = 'LeapEnter',
  callback = function()
    vim.cmd.hi('Cursor', 'blend=100')
    vim.opt.guicursor:append { 'a:Cursor/lCursor' }
  end,
})

autocmd('User', {
  pattern = 'LeapLeave',
  callback = function()
    vim.cmd.hi('Cursor', 'blend=0')
    vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
  end,
})

autocmd('FileType', {
  pattern = { 'Nvdash', 'Lazy', 'Telescope' },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
