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
- `~/.codex/AGENTS.md` (global conversation history guidance)
- `~/.codex/skills/inspect-pac-proxy`
- `~/.codex/skills/paper-reading-four-questions`
- `~/.codex/skills/technical-english-polish`

Personal third-party skills and their install commands are listed in [skills.md](skills.md). This source-only file is excluded from `chezmoi apply`.

## Useful commands

```bash
chezmoi source-path
chezmoi managed
chezmoi status
chezmoi diff
chezmoi apply
```

## Codex conversation history

The global `~/.codex/AGENTS.md` instructs Codex to search the session history
archive when reviewing past conversations, including hidden and ignored files
across all archived devices and applications. Only the guidance is managed by
chezmoi; the archive contents are not tracked in this repository.

On WSL, the archive root defaults to `/mnt/d/Personal/buddy-history`. Other
operating systems require an explicit path. To override the path on any device,
add the following to the local chezmoi configuration (`chezmoi edit-config`),
merging it into an existing `[data]` table if present:

```toml
[data]
sessionHistoryDir = "/absolute/path/to/buddy-history"
```

Then apply only the global instructions:

```bash
chezmoi diff ~/.codex/AGENTS.md
chezmoi apply ~/.codex/AGENTS.md
```

If no path is configured on a non-WSL device, the generated instructions tell
Codex to ask for the archive location. Start a new Codex session after applying
the instructions so that it loads the updated guidance.
