// Start of Document /</repo:code_pid/best_practice/no_positional_struct_initialization.md/>

# Best Practice: No Positional Struct Initialization

## Rule
Never construct a struct using positional arguments:

```
TypeName (x, y, z)
```

Always use explicit named‑argument construction via `static make ()`:

```
TypeName instance = TypeName.make (field1: x, field2: y, field3: z);
```

## Why This Earned Best‑Practice Status

- **No Positional Ambiguity** — Order is not meaning. Positional construction hides semantics behind argument order.
- **Precise Field Binding** — The reader knows exactly which value binds to which field. No guessing. No inference.
- **Struct Maintainer Sovereignty** — The struct maintainer is free to reorder fields for maximum clarity. They may add new fields and place them exactly where they belong. External code must not depend on internal field order.
- **Field Order Is Private** — The order of fields is an implementation detail. It should not be visible to outsiders. It is none of their business.
- **No Implicit `.init` Semantics** — Positional construction silently relies on struct layout. Prax forbids hidden shape.
- **Invariant Enforcement** — `make ()` is the correct place to enforce domain invariants. Construction becomes a correctness checkpoint.
- **Sealed‑Domain Geometry** — Named fields reinforce domain boundaries and prevent drift or accidental swaps.
- **Junior‑Clarity** — A junior programmer can understand the domain shape immediately from the named arguments.
- **AI Regeneration Safety** — When AI regenerates a file, named arguments guarantee correctness. No missing fields. No misordered values.

## Operational Benefit
Named construction eliminates silent breakage when struct fields are reordered, added, or removed. Positional construction cannot survive domain evolution; named construction can.

// End of Document /</repo:code_pid/best_practice/no_positional_struct_initialization.md/>
