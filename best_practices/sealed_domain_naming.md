// Start of Document /</repo:code_pid/best_practice/sealed_domain_naming.md/>

# Best Practice: Sealed‑Domain Naming Rules

## Rule
Names must reflect the exact stage of domain processing.  
A name is not decoration — it is a correctness signal.

Examples:

- **Specimens** — `raw_cli_args`  
- **Tokens** — `tokens_lower_cli_args`  
- **Meanings** — `Command_Line_Meaning`  

## Why This Earned Best‑Practice Status

- **Stage‑Correct Terminology** — Names must reveal the processing stage. A specimen is not a token. A token is not a meaning. No premature naming.
- **Domain Purity** — Each stage has its own vocabulary. Mixing vocabulary collapses domain boundaries and destroys clarity.
- **Precise Origin Tracking** — The reader knows exactly *where* in the pipeline a value came from. No guessing. No inference.
- **Invariant Enforcement** — Naming enforces domain invariants. A value cannot be misused at the wrong stage because its name forbids it.
- **Junior‑Clarity** — A junior programmer can understand the entire pipeline simply by reading the names. No IDE required.
- **Sealed‑Domain Geometry** — Names encode the geometry of the domain. They prevent drift, accidental reuse, and misclassification.
- **AI Regeneration Safety** — When AI regenerates a file, stage‑correct names ensure the pipeline remains intact and unambiguous.

## Operational Benefit
Sealed‑domain naming makes the entire processing pipeline self‑documenting.  
When reviewing regenerated code, the operator can verify correctness instantly by inspecting names alone.

// End of Document /</repo:code_pid/best_practice/sealed_domain_naming.md/>
