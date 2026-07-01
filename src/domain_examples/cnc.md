###### Start of Document /\<repo:code_pid/src/domain_examples/cnc.md\>/

# CNC Domain Examples

This document provides concrete examples of values that are **inside** the CNC Domain (coherent, allowed, valid) and values that are **outside** the CNC Domain (prohibited, incoherent, invalid).  
It is part of the Prax **Ubiquitous Language** and supports sealed‑domain correctness physics.

## ✔ Allowed CNC Domain Values

### Example 1 — Minimal valid CNC
```
letter_major = 'a'
number       = 0
letter_minor = NUL
```
Major letter present.  
Number is zero → minor letter must be NUL.

### Example 2 — CNC with number but no minor letter
```
letter_major = 'c'
number       = 12
letter_minor = NUL
```
Number is non‑zero.  
Minor letter is NUL → allowed.

### Example 3 — Fully populated CNC
```
letter_major = 'b'
number       = 7
letter_minor = 'd'
```
Major letter ∈ [a–z].  
Number ∈ [1–99].  
Minor letter ∈ [a–z].

## ✘ Prohibited CNC Domain Values

### Example 1 — Minor letter present when number is zero
```
letter_major = 'q'
number       = 0
letter_minor = 'z'
```
Minor letter cannot exist when number == 0.

### Example 2 — Major letter missing
```
letter_major = NUL
number       = 5
letter_minor = 'a'
```
Major letter must always be in [a–z].

### Example 3 — Number out of range
```
letter_major = 'm'
number       = 123
letter_minor = NUL
```
Number must be in [1–99] when non‑zero.

### Example 4 — Minor letter out of range
```
letter_major = 'h'
number       = 3
letter_minor = '#'
```
Minor letter must be in [a–z].

## Domain Summary

A CNC value is **inside** the Domain when:

- letter_major ∈ ‘a’..‘z’  
- number ∈ {0} ∪ [1..99]  
- letter_minor ∈ {NUL} ∪ ‘a’..‘z’  
- number == 0 → letter_minor must be NUL  
- number > 0 → letter_minor may be NUL or ‘a’..‘z’

A CNC value is **outside** the Domain when any of these relationships are violated.

###### End of Document /\<repo:code_pid/src/domain_examples/cnc.md\>/
