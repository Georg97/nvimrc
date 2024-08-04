local builtin = {}

local function get_sudo_password()
    return vim.fn.inputsecret("NVIM Sudo pw: ")
end

local function sudo_execute(command, password)
    os.execute("sudo -S " .. password .. " && " .. command)
    -- local cmd = string.format("echo '%s' | sudo -S %s", password, command)
    -- local handle = io.popen(cmd)
    -- local result = handle:read("*a")
    -- handle:close()
    -- return result
end

local function command_exists(cmd)
    local handle = io.popen("command -v " .. cmd .. " 2>/dev/null")
    local result = handle:read("*a")
    handle:close()
    return result ~= ""
end

-- Function to install packages using a specific package manager
local function install_packages(packages)
    local cmd = ""
    local sudo_pw = get_sudo_password()

    -- if bs.command_exists("apt") then
    --     cmd = "sudo apt update && sudo apt install " .. packages
    -- elseif bs.command_exists("pacman") then
    --     cmd = "sudo pacman -Syu --noconfirm " .. packages
    -- elseif bs.command_exists("zypper") then
    --     cmd = "sudo zypper refresh && sudo zypper install -y " .. packages
    -- else
    --     print("No supported package manager found.")
    --     return false
    -- end

    sudo_execute("sudo pacman -Syu --noconfirm " .. packages, sudo_pw)

    return true
end

builtin.command_exists = command_exists
builtin.install_packages = install_packages

return builtin
