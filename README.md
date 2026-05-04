# homebrew-claude-jail

Homebrew tap for [claude-jail](https://github.com/oakblu/claude-jail) — a Docker sandbox for Claude Code.

## Install

```bash
brew install oakblu/claude-jail/claude-jail
```

> Note: `brew install oakblu/claude-jail` (short form) does not work — Homebrew requires the full `tap/formula` form for third-party taps.

## Usage

```bash
claude-jail             # start an interactive Claude session in the current directory
claude-jail --help      # show help
claude-jail --install   # (re-)run shell setup if it was skipped
claude-jail --uninstall # remove shell PATH entry added during install
```

## Requirements

Docker must be installed and running. Options:

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [OrbStack](https://orbstack.dev)
- Colima: `brew install colima && colima start`

## Updating

```bash
brew upgrade oakblu/claude-jail/claude-jail
```

## Uninstall

```bash
claude-jail --uninstall    # remove shell PATH entry
brew uninstall claude-jail
brew untap oakblu/claude-jail
```
