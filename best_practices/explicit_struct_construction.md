// Start of Document /</repo:code_pid/best_practice/explicit_struct_construction.md/>

# Best Practice: Explicit Named‑Argument Struct Construction

## Rule
All structs — even tiny utility structs — must be constructed using explicit named arguments via `static make ()`:

```
Complex i = Complex.make (real_part: 0, imaginary_part: 1);
```

## Why This Earned Best‑Practice Status

- **Explicitness** — Every field is named. Every value is tied directly to its meaning. No positional ambiguity.
- **Precise Origin Tracking** — The reader knows exactly which value binds to which field. No guessing. No inference.
- **No IDE Dependency** — The meaning is visible in the code itself. No hovering required to understand field order.
- **Pure D Syntax** — Uses named arguments and static factory methods. No macros, no DSLs, no magic.
- **Explicit Construction Step** — `make ()` makes construction intentional and visible. Construction is a meaning‑bearing act.
- **Junior‑Clarity** — A junior programmer can read the call and understand the domain shape immediately.
- **Sealed‑Domain Geometry** — Construction enforces domain boundaries. Named fields prevent drift and accidental swaps.
- **AI Regeneration Safety** — When AI regenerates a file, named arguments guarantee correctness. No missing fields. No misordered values.

## Operational Benefit
Named‑argument construction acts as a correctness checkpoint. When reviewing regenerated code, the operator can verify domain shape instantly without relying on positional rules.

// End of Document /</repo:code_pid/best_practice/explicit_struct_construction.md/>
