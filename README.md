# dotfiles

Chezmoi source repository for personal dotfiles.

## Quick install

If `chezmoi` is not installed yet:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Zhaoyilunnn
```

If `chezmoi` is already installed:

```bash
chezmoi init --apply Zhaoyilunnn
```

For private-repo/SSH usage:

```bash
chezmoi init --apply git@github.com:Zhaoyilunnn/dotfiles.git
```

## What is managed

- `~/.config/nvim` (exact)
- `~/.codex/skills/inspect-pac-proxy`

## Useful commands

```bash
chezmoi source-path
chezmoi managed
chezmoi status
chezmoi diff
chezmoi apply
```
