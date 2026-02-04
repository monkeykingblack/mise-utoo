--- Returns a list of available versions for the tool
--- Documentation: https://mise.jdx.dev/tool-plugin-development.html#available-hook
--- @param ctx {args: string[]} Context (args = user arguments)
--- @return table[] List of available versions
function PLUGIN:Available(ctx)
    local http = require("http")
    local json = require("json")

    local per_page = 100
    local page = 1
    local result = {}
    local github_token = os.getenv("GITHUB_TOKEN") or os.getenv("GH_TOKEN")
    local headers = {
        ["Accpet"] = "application/vnd.github.v3+json",
    }

    if github_token and github_token ~= "" then
        headers["Authorization"] = "token " .. github_token
    end

    while true do
        -- Example 1: GitHub Tags API (most common)
        -- Replace <GITHUB_USER>/<GITHUB_REPO> with your tool's repository
        -- local repo_url = "https://api.github.com/repos/<GITHUB_USER>/<GITHUB_REPO>/tags"

        -- Example 2: GitHub Releases API (for tools that use GitHub releases)
        -- local repo_url = "https://api.github.com/repos/<GITHUB_USER>/<GITHUB_REPO>/releases"

        local repo_url = "https://api.github.com/repos/utooland/utoo/tags"
            .. "?per_page="
            .. per_page
            .. "&page="
            .. page

        -- mise automatically handles GitHub authentication - no manual token setup needed
        local resp, err = http.get({
            url = repo_url,
            headers = headers,
        })

        if err ~= nil then
            error("Failed to fetch versions: " .. err)
        end
        if resp.status_code ~= 200 then
            error("GitHub API returned status " .. resp.status_code .. ": " .. resp.body)
        end

        local tags = json.decode(resp.body)

        if tags == nil or #tags == 0 then
            break
        end

        -- Process tags/releases
        for _, tag in ipairs(tags) do
            -- For releases API, you might want:
            local version = tag.name
            if version:match("^utoo%-v%d") then
                version = version:gsub("^utoo%-v", "")
                local is_prerelease = tag.prerelease or false
                local note = is_prerelease and "pre-release" or nil

                table.insert(result, {
                    version = version,
                    note = note, -- Optional: "latest", "lts", "pre-release", etc.
                    -- addition = {} -- Optional: additional tools/components
                })
            end
        end

        if #tags < per_page then
            break
        end

        page = page + 1
    end

    return result
end
