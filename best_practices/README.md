// Start of Document /</repo:code_pid/best_practice/README.md/>

# Prax Best Practices — Overview

The `best_practice/` directory defines the operational rules that keep Prax deterministic, explicit, and sealed‑domain correct.  
Each best practice exists to eliminate ambiguity, prevent drift, and ensure that regenerated files are complete, verifiable, and junior‑proof.

## Purpose of This Directory
This directory provides the mandatory rules for:

- **Explicit boundaries** — UGLY BETTY header/footer lines guarantee complete‑file certainty and printout locatability.
- **Explicit imports** — Itemized imports reveal exactly which feature comes from which module.
- **Explicit types** — No `auto` except when the type is visually obvious at the call site.
- **Explicit construction** — Named‑argument struct construction via `static make ()`.
- **Explicit domain geometry** — No positional struct initialization; field order is private to the struct maintainer.
- **Explicit typography** — Space before parentheses separates meaning from mechanism.
- **Explicit naming** — Names encode the stage of domain processing and enforce domain boundaries.

## Operational Philosophy
Prax best practices exist for one reason:

**To make correctness visible.**

Every rule in this directory ensures that:

- The reader knows exactly what is happening.
- The maintainer retains full control over domain shape.
- AI regeneration produces complete, verifiable files.
- No hidden semantics or positional rules exist anywhere.
- Junior programmers can understand the code without tooling.

## File Index

- `header_footer_lines_with_UGLY_BETTY.md`  
- `itemized_imports.md`  
- `no_auto.md`  
- `auto.md`  
- `explicit_struct_construction.md`  
- `static_make.md`  
- `no_positional_struct_initialization.md`  
- `function_spacing.md`  
- `sealed_domain_naming.md`

Each file is self‑contained, explicit, and bounded by UGLY BETTY markers.

// End of Document /</repo:code_pid/best_practice/README.md/>
