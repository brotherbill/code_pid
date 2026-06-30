// Start of Document /</repo:code_pid/src/command_line_tokens_vm.d/>

module command_line_tokens_vm;

import command_line_tokens_vm_helpers.token_kinds                  : TokenKind, classify_token;
import command_line_tokens_vm_helpers.command_line_meaning_invalid : invalid;
import command_line_tokens_vm_helpers.command_line_meaning_chapter : command_line_meaning_chapter;
import command_line_tokens_vm_helpers.command_line_meaning_page    : command_line_meaning_page;
import command_line_tokens_vm_helpers.command_line_meaning_section : command_line_meaning_section;

// -------------------------------------------------------------------
// Domain types required by all meaning helpers
// -------------------------------------------------------------------

enum Section_Type
{
    none,
    ncn,   // number-major, letter, number-minor
    cnc    // letter-major, number, letter-minor
}

struct NCN
{
    ubyte number_major;  // 0–99 (0 means “missing”)
    char  letter;        // 'a'–'z' or NUL ('\0')
    ubyte number_minor;  // 0–99 (0 means “missing”)

    invariant
    {
        // Letter domain
        assert((letter == '\0') || ('a' <= letter && letter <= 'z'),
               "letter must be in the range 'a'–'z' or be NUL");

        // Numeric domain
        assert(number_major <= 99,
               "number_major must be in the range 0–99");

        assert(number_minor <= 99,
               "number_minor must be in the range 0–99");

        // Semantic completeness rules
        //
        // Case 1: NUL letter → both numbers must be zero
        if (letter == '\0')
        {
            assert(number_major == 0,
                   "number_major must be 0 when letter is NUL");

            assert(number_minor == 0,
                   "number_minor must be 0 when letter is NUL");
        }

        // Case 2: letter present → at least one number must be non‑zero
        else
        {
            assert(number_major != 0 || number_minor != 0,
                   "at least one number must be non‑zero when letter is present");
        }
    }
}

struct CNC
{
    char  letter_major;  // 'a'–'z'
    ubyte number;        // 0–9
    char  letter_minor;  // 'a'–'z'
}

struct Command_Line_Meaning
{
    bool  is_valid;
    bool  is_tree_descent;

    bool  has_chapter;
    bool  has_page;

    ushort chapter;
    ushort page;

    Section_Type section_type;

    NCN ncn;
    CNC cnc;
}

// -------------------------------------------------------------------
// VM
// -------------------------------------------------------------------

struct Command_Line_Tokens_VM
{
    string[]   tokens_lower_cli_args;
    // ... other fields ...

    @safe pure nothrow
    Command_Line_Meaning meaning() const
    {
        if (tokens_lower_cli_args.length == 0)
            return invalid();

        TokenKind[] kinds;
        kinds.length = tokens_lower_cli_args.length;

        foreach (i, t; tokens_lower_cli_args)
        {
            kinds[i] = classify_token(t);
            if (kinds[i] == TokenKind.invalid)
                return invalid();
        }

        // chapter
        if (kinds.length == 1 && kinds[0] == TokenKind.chapter)
            return command_line_meaning_chapter(tokens_lower_cli_args, kinds);

        // page
        if (kinds.length == 1 && kinds[0] == TokenKind.page)
            return command_line_meaning_page(tokens_lower_cli_args, kinds);

        // section (NCN/CNC)
        if (kinds.length == 1 && kinds[0] == TokenKind.section)
            return command_line_meaning_section(tokens_lower_cli_args, kinds);

        return invalid();
    }
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm.d/>
