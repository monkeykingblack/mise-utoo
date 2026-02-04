-- Helper function for platform detection (uncomment and modify as needed)
local function get_platform()
    -- RUNTIME object is provided by mise/vfox
    -- RUNTIME.osType: "Windows", "Linux", "Darwin"
    -- RUNTIME.archType: "amd64", "386", "arm64", etc.

    local os_name = RUNTIME.osType:lower()
    local arch = RUNTIME.archType

    -- Map to your tool's platform naming convention
    -- Adjust these mappings based on how your tool names its releases
    local platform_map = {
        ["darwin"] = {
            ["amd64"] = "darwin-x64",
            ["arm64"] = "darwin-arm64",
        },
        ["linux"] = {
            ["amd64"] = "linux-x64",
            ["arm64"] = "linux-arm64",
        },
        ["windows"] = {
            ["amd64"] = "windows-x64",
        },
    }

    local os_map = platform_map[os_name]
    if os_map then
        return os_map[arch] or "linux-x64" -- fallback
    end

    -- Default fallback
    return "linux-x64"
end

--- Returns download information for a specific version
--- Documentation: https://mise.jdx.dev/tool-plugin-development.html#preinstall-hook
--- @param ctx {version: string, runtimeVersion: string} Context
--- @return table Version and download information
function PLUGIN:PreInstall(ctx)
    local version = ctx.version

    -- Replace with your actual download URL pattern
    local platform = get_platform()
    local url = "https://github.com/utooland/utoo/releases/download/utoo-v"
        .. version
        .. "/utoo-"
        .. platform
        .. ".tar.gz"


    return {
        version = version,
        url = url,
        note = "Downloading utoo " .. version,

    }
end
