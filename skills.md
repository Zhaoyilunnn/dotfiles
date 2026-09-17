# Personal skills

This is the source list for third-party skills I use globally. The skill files are installed by their own tools; chezmoi does not copy them into the home directory.

## Archify

- Source: https://github.com/tt-a1i/archify
- Skill: `archify`
- Purpose: Create interactive architecture, workflow, sequence, data-flow, and lifecycle diagrams.
- Install for Codex:

  ```bash
  npx skills add tt-a1i/archify --skill archify --agent codex --global --yes
  ```

- Update CLI-managed skills: `npx skills update --global`

After installing, use `npx skills ls -g` to confirm that Archify is tracked by the CLI.
