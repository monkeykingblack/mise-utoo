# mise-en-place utoo plugin

A [mise](https://mise.jdx.dev/) plugin for [Utoo tool](https://utoo.land/)

## About Utoo

Utoo is a modern, high-performance frontend toolchain designed to provide a unified and optimized experience. It combines a fast package manager, a powerful bundler, and a flexible command system into a single, cohesive ecosystem.

## Usage

**Install the plugin**

```sh
mise plugin install https://github.com/monkeykingblack/mise-utoo
```

**Install Utoo**

```sh
# Install latest version
mise use -g utoo@latest

# Or install specific version
mise use -g utoo@1.0.7
```

Once installd via mise, utoo command will be availabel in your PATH:

```sh
# Check version
utoo --version

# List availabel command 
utoo --help
```

## Development

### Setting up development environment

1. Install pre-commit hooks (optional but recommended):
```bash
hk install
```

This sets up automatic linting and formatting on git commits.

### Local Testing

1. Link your plugin for development:
```bash
mise plugin link --force <TOOL> .
```

2. Run tests:
```bash
mise run test
```

3. Run linting:
```bash
mise run lint
```

4. Run full CI suite:
```bash
mise run ci
```

### More info

Refer to the mise docs for detailed information:

- [Tool plugin development](https://mise.jdx.dev/tool-plugin-development.html) - Complete guide to plugin development
- [Lua modules reference](https://mise.jdx.dev/plugin-lua-modules.html) - Available Lua modules and functions
- [Plugin publishing](https://mise.jdx.dev/plugin-publishing.html) - How to publish your plugin
- [mise-plugins organization](https://github.com/mise-plugins) - Community plugins repository


## License

MIT
