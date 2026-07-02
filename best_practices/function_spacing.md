// Start of Document /</repo:code_pid/best_practice/function_spacing.md/>

# Best Practice: Space Before Parentheses in Function Signatures and Calls

## Rule
Function names must be written with a space before the parentheses:

```
meaning ()
command_line_meaning_page ()
Command_Line_Tokens_VM.make (lower_cli_args)
```

## Why This Earned Best‑Practice Status

- **Meaning vs Mechanism** — The function name expresses meaning. The parentheses express mechanism. The space separates these two concepts cleanly.
- **Visual Clarity** — The space prevents the name from visually “gluing” to the parentheses, eliminating the compressed OOP look.
- **Junior‑Clarity** — A junior programmer can instantly recognize a function call. The spacing makes the call site unmistakable.
- **Deterministic Geometry** — Typography is part of Prax’s correctness geometry. The space reinforces intentionality and prevents visual ambiguity.
- **Consistency** — The same spacing rule applies to both function signatures and function calls. No exceptions.
- **AI Regeneration Safety** — When AI regenerates a file, the spacing rule ensures that function calls remain visually distinct and easy to verify.

## Operational Benefit
The spacing rule makes function calls grep‑friendly and visually scannable. When reviewing regenerated code, the operator can instantly identify call sites without relying on syntax highlighting or IDE tooling.

// End of Document /</repo:code_pid/best_practice/function_spacing.md/>
