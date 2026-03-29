# Recommended CLI Tools for AI Development

## External services

- GitHub: `gh`
- Jira: `acli`
- AWS: `aws`
- CircleCI: API v2 via `curl` + `jq`, token in `$CIRCLECI_TOKEN`

## Shell tools

- FILES → `fd`
- TEXT → `rg`
- CODE STRUCTURE → `ast-grep`
- SELECT from results → pipe to `fzf`
- JSON → `jq`

## Browser Automation

- [agent-browser](https://agent-browser.dev/)
- [portless](https://port1355.dev/)

## Code cleanup

- `knip` to find unused code and dependencies (npx knip )

## skills

- [skills.sh](npx skills add <owner/repo>)

### Favorite skills

- find-skills `npx skills add https://github.com/vercel-labs/skills --skill find-skills`
- skill-creator `npx skills add https://github.com/anthropics/skills --skill skill-creator`
- web-design-guidelines `npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines`
