// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/token_kinds.d/>

module command_line_tokens_vm_helpers.token_kinds;

import utilities.is_digit : is_digit;
import utilities.is_alpha : is_alpha;
// import utilities.to_lower : to_lower;

enum TokenKind
{
    chapter,   // c10, 10 (1–90)
    page,      // p10, 1–999
    section,   // a, a1, 3a2, etc.
    invalid
}

@safe pure nothrow
TokenKind classify_token(const string s)
{
    // s is guaranteed:
    // - non-empty
    // - ASCII
    // - lowercase
    // - normalized by partitioning

    // --------------------------------------------
    // Prefixed page: pNN
    // --------------------------------------------
    if (s.length >= 2 && s[0] == 'p')
    {
        foreach (ch; s[1 .. $])
            if (!is_digit(ch))
                return TokenKind.invalid;

        return TokenKind.page;
    }

    // --------------------------------------------
    // Naked numeric: NN
    // --------------------------------------------
    bool all_digits = true;
    foreach (ch; s)
        if (!is_digit(ch))
            all_digits = false;

    if (all_digits)
    {
        import std.conv : to;

        ushort n;
        try
        {
            n = s.to!ushort;
        }
        catch (Exception)
        {
            return TokenKind.invalid;
        }

        // Domain invariants:
        // 1–90   → chapter
        // 91–999 → page
        // >999   → invalid

        if (n >= 1 && n <= 90)
            return TokenKind.chapter;

        if (n >= 91 && n <= 999)
            return TokenKind.page;

        return TokenKind.invalid;
    }

    // --------------------------------------------
    // Section tokens: a, a1, 3a2, etc.
    // --------------------------------------------
    bool has_alpha = false;
    bool has_digit = false;

    foreach (ch; s)
    {
        if (is_alpha(ch)) has_alpha = true;
        else if (is_digit(ch)) has_digit = true;
        else return TokenKind.invalid;
    }

    if (has_alpha)
        return TokenKind.section;

    return TokenKind.invalid;
}


// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/token_kinds.d/>