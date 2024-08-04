local bs = require("util.bootstrap")

local function bootstrap()
    print("Hello, World")
    print("Hello, World")
    print("Hello, World")
    -- Packages to install
    local packages = ""

    -- Check if ripgrep is installed
    if not bs.command_exists("rg") then
        packages = packages .. " ripgrep"
    end

    -- Check if util-linux-libs is installed
    if not bs.command_exists("lscpu") then -- Assuming lscpu as a representative command from util-linux-libs
        packages = packages .. " util-linux"
    end

    -- Exit if all packages are installed
    if packages == "" then
        print("All necessary packages are already installed.")
        return true
    end

    bs.install_packages(packages)
    -- Install packages if a package manager is found
    -- if pkg_manager then
    --     return bs.install_packages(packages)
    -- else
    --     print("Could not install packages " .. packages)
    --     return false
    -- end
end

bootstrap()
