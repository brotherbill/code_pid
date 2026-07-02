// Start of Document /</repo:code_pid/best_practice/static_make.md/>

# Best Practice: Use `static make ()` for Construction

## Rule
All domain structs must be constructed via an explicit factory function:

```
TypeName instance = TypeName.make (field1: x, field2: y);
```

## Why This Earned Best‑Practice Status

- **Explicit Construction Step** — `make ()` makes construction intentional and visible. The reader sees a domain object being created, not a side effect or implicit initialization.
- **Precise Origin Tracking** — The reader knows exactly which values bind to which fields. No positional ambiguity. No guessing.
- **Invariant Enforcement** — `make ()` is the correct place to enforce domain invariants. Construction becomes a correctness checkpoint.
- **No Positional Struct Initialization** — Prevents accidental reliance on field order or implicit `.init` semantics.
- **Sealed‑Domain Geometry** — Construction is a domain event. Using `make ()` reinforces domain boundaries and prevents drift.
- **Junior‑Clarity** — A junior programmer can read the call and understand the domain shape immediately.
- **AI Regeneration Safety** — When AI regenerates a file, `make ()` ensures the struct is constructed correctly, with all required fields present and named.

## Operational Benefit
`make ()` centralizes construction logic. When reviewing regenerated code, the operator can verify domain correctness instantly by inspecting the factory function.

// End of Document /</repo:code_pid/best_practice/static_make.md/>
