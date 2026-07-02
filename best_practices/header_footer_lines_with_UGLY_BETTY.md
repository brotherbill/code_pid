// Start of Document /</repo:code_pid/best_practice/header_footer_lines_with_UGLY_BETTY.md/>

# Best Practice: UGLY BETTY Header/Footer Lines

## Rule
All Prax documents use explicit boundary markers in the form:

```
/< repo:<my_repo>/path/to/some_file.d />
```

## Why This Earned Best‑Practice Status

- **Complete‑File Certainty** — When AI regenerates a file, UGLY BETTY guarantees that the entire file was produced. If both the header and footer appear, the operator knows the file is complete. If either is missing, the file is incomplete. This is the primary benefit.
- **Printout Locatability** — If you have a printed copy, you can instantly locate the corresponding file in the repo because the boundary marker includes the full repo path. No searching, no guessing.
- **Explicitness** — The markers are visually distinct and cannot be mistaken for code.
- **Tooling Safety** — They are grep‑friendly and never collide with D syntax.
- **Deterministic Extraction** — Documentation tools can reliably detect boundaries.
- **Junior‑Proof** — Even the greenest programmer knows these are structural markers.
- **Prax Geometry** — Boundaries must be visible, intentional, and unmistakable.

// End of Document /</repo:code_pid/best_practice/header_footer_lines_with_UGLY_BETTY.md/>
