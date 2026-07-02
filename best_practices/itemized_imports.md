// Start of Document /</repo:code_pid/best_practice/itemized_imports.md/>

# Best Practice: Itemized Imports Only

## Rule
Every import must explicitly list the features being imported:

```
import foo : bar, baz;
```

## Why This Earned Best‑Practice Status

- **Precise Origin Tracking** — The reader knows exactly which feature came from which module. No ambiguity. No guessing. No hidden dependencies.
- **Explicit Dependencies** — The dependency graph is visible directly in the import line. No accidental symbols leak into the module.
- **Sealed‑Domain Purity** — Itemized imports prevent domain bleed. Only the explicitly named features cross the boundary.
- **Refactoring Safety** — When refactoring, you know exactly which features are used. No surprises from wildcard imports.
- **Junior‑Clarity** — A junior programmer can see the exact set of imported features without opening the module.
- **Deterministic Geometry** — Itemized imports reinforce Prax’s invariant‑driven architecture: explicit, intentional, and unambiguous.
- **No Magic** — Wildcard imports hide meaning. Itemized imports reveal it.

## Operational Benefit
When regenerating a file with AI, itemized imports ensure the regenerated file contains the exact dependency list. No missing imports. No accidental additions. The import section becomes a correctness checkpoint.

// End of Document /</repo:code_pid/best_practice/itemized_imports.md/>
