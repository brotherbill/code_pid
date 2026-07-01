###### Start of Document /<home/bb/dev/code_pid/src/domain_examples/section_ncn.md>/

# Section_NCN Domain Examples

This document provides examples of values that are **inside** the Section_NCN Domain (allowed, valid) and values that are **outside** the Domain (prohibited, invalid).

## ✔ Allowed Section_NCN Domain Values

### Example 1 — Minimal valid NCN (major number only)
```
number_major = 1
letter       = NUL
number_minor = 0
```
Major number ∈ [1–99].  
Letter absent.  
Minor number = 0 → allowed.

### Example 2 — NCN with major number and letter
```
number_major = 12
letter       = 'c'
number_minor = 0
```
Major number ∈ [1–99].  
Letter ∈ [a–z].  
Minor number = 0.

### Example 3 — Fully populated NCN
```
number_major = 7
letter       = 'b'
number_minor = 3
```
All components present and valid.

## ✘ Prohibited Section_NCN Domain Values

### Example 1 — Minor number present when letter is NUL
```
number_major = 4
letter       = NUL
number_minor = 2
```
Minor number cannot exist when letter == NUL.

### Example 2 — Major number missing (zero)
```
number_major = 0
letter       = 'a'
number_minor = 1
```
Major number must always be in [1–99].

### Example 3 — Major number out of range
```
number_major = 123
letter       = 'm'
number_minor = 0
```
Major number must be in [1–99].

### Example 4 — Letter out of range
```
number_major = 5
letter       = '#'
number_minor = 0
```
Letter must be in [a–z] or NUL.

### Example 5 — Minor number out of range
```
number_major = 8
letter       = 'h'
number_minor = 200
```
Minor number must be in [0–99].

## Domain Summary

A Section_NCN value is **inside** the Domain when:

- number_major ∈ [1..99]  
- letter ∈ {NUL} ∪ ‘a’..‘z’  
- number_minor ∈ [0..99]  
- letter == NUL → number_minor must be 0  
- letter ∈ ‘a’..‘z’ → number_minor may be 0..99

A Section_NCN value is **outside** the Domain when any of these relationships are violated.

###### End of Document /<home/bb/dev/code_pid/src/domain_examples/section_ncn.md>/
