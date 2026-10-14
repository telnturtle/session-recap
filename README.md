# session-recap

`session-recap` is a skill for Claude Code and OpenAI Codex CLI that helps you quickly resume work after a break. It reads your conversation history and provides a chronological, single-line summary of what was discussed, what was accomplished, what is currently running, and what comes next.

## Example Output

```text
1. **Timeout investigation:** traced auth-service connection timeouts to an unindexed query on the sessions table.
2. **Migration:** added an index on user_id and expires_at in a new migration.
3. **Regression test:** added an integration test that reproduces the timeout and passes with the fix.
4. **Code review:** two reviewers approved PR #42 after one round of fixes.

**In progress:**
5. **Load test:** background run against staging; no results reported yet.

**Next:**
6. **Merge decision:** check load-test latency, then decide whether to merge PR #42.
```

## Usage

This skill is invoked only via explicit slash command:

- `/session-recap`: Summarize the current session into 6–10 numbered, single-line items.
- `/session-recap <topic>`: Summarize only discussion and changes relevant to `<topic>`.

The summary is generated strictly from the active conversation without running tools or shell commands, and it responds in the language used in the session. Completed tasks appear first, followed by "In progress" items (such as active subagents or pending reviews) and "Next" items (decisions or next steps).

## Install

### Method 1: Install Script

Installs to `~/.claude/skills/session-recap` by default, and also to `~/.codex/skills/session-recap` if `~/.codex` exists:

```sh
curl -fsSL https://raw.githubusercontent.com/telnturtle/session-recap/main/install.sh | sh
```

To specify custom installation directories:

```sh
curl -fsSL https://raw.githubusercontent.com/telnturtle/session-recap/main/install.sh | sh -s -- <skills-dir> ...
```

Existing installations are skipped. Use `FORCE=1` to overwrite:

```sh
curl -fsSL https://raw.githubusercontent.com/telnturtle/session-recap/main/install.sh | FORCE=1 sh
```

### Method 2: Git Clone

Clone into your target skills directory:

```sh
# Claude Code
git clone https://github.com/telnturtle/session-recap ~/.claude/skills/session-recap

# OpenAI Codex
git clone https://github.com/telnturtle/session-recap ~/.codex/skills/session-recap
```

### Method 3: Manual Copy

For users who prefer not to run `curl | sh`, copy `SKILL.md` and `agents/openai.yaml` directly:

```sh
mkdir -p ~/.claude/skills/session-recap/agents
cp SKILL.md ~/.claude/skills/session-recap/
cp agents/openai.yaml ~/.claude/skills/session-recap/agents/
```

Repeat for `~/.codex/skills/session-recap/` if using OpenAI Codex.

## Update

If installed via the script, re-run with `FORCE=1`:

```sh
curl -fsSL https://raw.githubusercontent.com/telnturtle/session-recap/main/install.sh | FORCE=1 sh
```

If installed via Git, pull the latest changes:

```sh
git -C ~/.claude/skills/session-recap pull
```

## License

MIT
