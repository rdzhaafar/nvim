vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use({"projekt0n/github-nvim-theme", tag = "v0.0.7"})
end)

