###### Start of Document /<repo:code_pid/src/domain_examples/section_cnc.md>/

# Section_CNC Domain Examples

This document provides examples of values that are **inside** the Section_CNC Domain (allowed, valid) and values that are **outside** the Domain (prohibited, invalid).

## ✔ Allowed Section_CNC Domain Values

### Example 1 — Minimal valid CNC (number only)
```
letter_major = 'a'
number       = 1
letter_minor = NUL
```
Major letter present.  
Number ∈ [1–99].  
Minor letter absent → allowed.

### Example 2 — CNC with number and minor letter
```
letter_major = 'c'
number       = 12
letter_minor = 'f'
```
Major letter ∈ [a–z].  
Number ∈ [1–99].  
Minor letter ∈ [a–z].

### Example 3 — Fully populated CNC
```
letter_major = 'b'
number       = 7
letter_minor = 'd'
```
All components present and valid.

## ✘ Prohibited Section_CNC Domain Values

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
Number must be in [1–99].

### Example 4 — Minor letter out of range
```
letter_major = 'h'
number       = 3
letter_minor = '#'
```
Minor letter must be in [a–z].

## Domain Summary

A Section_CNC value is **inside** the Domain when:

- letter_major ∈ ‘a’..‘z’  
- number ∈ [1..99]  
- letter_minor ∈ {NUL} ∪ ‘a’..‘z’  
- number > 0 → letter_minor may be NUL or ‘a’..‘z’

A Section_CNC value is **outside** the Domain when any of these relationships are violated.

###### End of Document /<repo:code_pid/src/domain_examples/section_cnc.md>/
