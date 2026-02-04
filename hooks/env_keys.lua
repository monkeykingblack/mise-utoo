--- Configures environment variables for the installed tool
--- Documentation: https://mise.jdx.dev/tool-plugin-development.html#envkeys-hook
--- @param ctx {path: string, runtimeVersion: string, sdkInfo: table} Context
--- @return table[] List of environment variable definitions
function PLUGIN:EnvKeys(ctx)
    local mainPath = ctx.path
    -- local sdkInfo = ctx.sdkInfo[PLUGIN.name]
    -- local version = sdkInfo.version

    -- Basic configuration (minimum required for most tools)
    -- This adds the bin directory to PATH so the tool can be executed
    return {
        {
            key = "PATH",
            value = mainPath .. "/bin",
        },
    }
end
