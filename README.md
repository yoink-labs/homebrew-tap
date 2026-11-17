# Yoink Labs Homebrew tap

Install Split to manage shared expenses from your terminal or MCP client.

```sh
brew install yoink-labs/tap/split
split --version
split login
split groups list --json
```

Approve the code under **You → Connected computers** in Split on your iPhone. Use a build that includes this screen. You can revoke the computer there later.

Run `split --help` for commands. Configure Claude Desktop or Cursor to launch the installed executable as follows. Substitute the path from `command -v split` if your Homebrew prefix differs.

```json
{"mcpServers":{"split":{"command":"/opt/homebrew/bin/split","args":["mcp"]}}}
```

For Codex, run `codex mcp add split -- /opt/homebrew/bin/split mcp`. The installed guide lives at `$(brew --prefix yoink-labs/tap/split)/libexec/cli/README.md`. The macOS file-splitting tool is available at `/usr/bin/split`.

Upgrade with `brew update && brew upgrade yoink-labs/tap/split`. Release archives contain the Node CLI and its guide.
