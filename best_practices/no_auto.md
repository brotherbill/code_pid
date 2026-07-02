// Start of Document /</repo:code_pid/best_practice/no_auto.md/>

# Best Practice: When `auto` Is Allowed

## Rule
`auto` must never hide a meaningful type from the reader.  
It is only allowed when the type is **obvious at the call site**.

Correct:

```
auto i = Complex.make (real_part: 0, imaginary_part: 1);
```

In this case, the type is **visibly** `Complex`.  
There is no ambiguity, no inference, no IDE hovering.

Incorrect:

```
auto meaning = vm.meaning ();
auto tokens = tokenize (raw_cli_args);
```

## Why This Earned Best‑Practice Status

- **Type Visibility** — `auto` hides the type from the reader. In Prax, type is meaning. Meaning must never be hidden.
- **Only Allowed When Type Is Obvious** — The `Complex.make` example is the only legitimate use: the type is visually present.
- **Explicit Types Everywhere Else** — Values with meaningful domain shape must declare their type explicitly:
  ```
  int x;
  string last_name;
  ```
- **Junior‑Clarity** — A junior programmer must be able to read the code and know the type instantly.
- **Sealed‑Domain Geometry** — Types encode domain boundaries. Hiding them collapses geometry.
- **AI Regeneration Safety** — Explicit types ensure regenerated files remain correct. `auto` introduces inference risk.

## Operational Benefit
Restricting `auto` to “obvious type” cases prevents accidental type hiding and keeps domain geometry visible.  
The reader always knows the shape of every value.

// End of Document /</repo:code_pid/best_practice/no_auto.md/>
