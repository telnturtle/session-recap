---
name: session-recap
description: "Slash-only. Recap what this session has discussed and done so far, in chronological order, one short line per step. For returning to a long session after a break."
disable-model-invocation: true
---

# Session Recap

The user is coming back to this session after a break and wants to re-orient fast.

## What to do

1. Read the whole current conversation, including any compacted summary. Do not run tools or commands; answer from the conversation only.
2. List what was discussed and done, **in chronological order**, as a numbered list.
3. Each item is one line: `**Short title:** one-line outcome or decision`.
4. Group the end of the list by state:
   - finished items first, in order
   - then `**In progress:**` items (running agents, pending reviews, waiting on someone). Never invent results for work that has not reported back.
   - then `**Next:**` items (decisions the user owes, next steps, optional follow-ups)
5. Keep it short: about 6–10 items. Merge small steps. No tables, no code blocks, no long reasons, no preamble or closing remarks.
6. Include identifiers that help resume work (ticket/issue/PR numbers, branch names) only when they matter.
7. Write everything, including the labels above, in the user's language.

## Arguments

If the user passes text after the command (for example `/session-recap database migration`), recap only the parts of the session related to that topic, in the same format.
