-- metadata.lua
-- Plugin metadata and configuration
-- Documentation: https://mise.jdx.dev/tool-plugin-development.html#metadata-lua

PLUGIN = { -- luacheck: ignore
    -- Required: Tool name (lowercase, no spaces)
    name = "utoo",

    -- Required: Plugin version (not the tool version)
    version = "1.0.1",

    -- Required: Brief description of the tool
    description = "A mise tool plugin for utoo",

    -- Required: Plugin author/maintainer
    author = "monkeykingblack",

    -- Optional: Repository URL for plugin updates
    updateUrl = "https://github.com/monkeykingblack/mise-utoo-plugin",

    -- Optional: Minimum mise runtime version required
    minRuntimeVersion = "0.2.0",

    -- Optional: Legacy version files this plugin can parse
    -- legacyFilenames = {
    --     ".<TOOL>-version",
    --     ".<TOOL>rc"
    -- }
}
