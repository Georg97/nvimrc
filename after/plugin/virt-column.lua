require("packer").startup(
function()
    use "lukas-reineke/virt-column.nvim"
end
)

require("virt-column").setup()
