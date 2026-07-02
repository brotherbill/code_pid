###### Start of Document /<home/bb/dev/code_pid/src/domain_examples/command_line_meaning.md>/

# Command_Line_Meaning Domain Examples

This document provides examples of values that are **inside** the Command_Line_Meaning Domain (allowed, valid) and values that are **outside** the Domain (prohibited, invalid).

## ✔ Allowed Command_Line_Meaning Domain Values

### Example 1 — Minimal valid meaning (chapter only)
```
is_valid       = true
chapter        = 1
page           = 0
section_type   = none
meaning_source = token
```
Chapter ∈ [1–255].  
Page = 0.  
Section type = none.  
Meaning source is legal.

### Example 2 — Valid NCN section meaning (tree‑descent)
```
is_valid       = true
chapter        = 0
page           = 0
section_type   = none
meaning_source = tree_descent
```
Tree‑descent meanings have is_valid=true and all other fields `.init`.

### Example 3 — Valid CNC section meaning
```
is_valid       = true
chapter        = 10
page           = 4
section_type   = cnc
meaning_source = token
```
All components present and valid.

## ✘ Prohibited Command_Line_Meaning Domain Values

### Example 1 — Invalid page (out of range)
```
is_valid       = true
chapter        = 5
page           = 1200
section_type   = ncn
meaning_source = tree_descent
```
Page must be in [0–999].

## Domain Summary

A Command_Line_Meaning value is **inside** the Domain when:

- is_valid == true  
- chapter ∈ [1..255]  
- page ∈ [0..999]  
- section_type ∈ {none, ncn, cnc}  
- section_type == none → page must be 0  
- section_type == cnc → page must be ≥ 1  
- meaning_source ∈ {tree_descent, token, unknown}

A Command_Line_Meaning value is **outside** the Domain when any of these relationships are violated.

###### End of Document /<home/bb/dev/code_pid/src/domain_examples/command_line_meaning.md>/
