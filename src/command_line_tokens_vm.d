// Start of Document /</repo:code_pid/src/command_line_tokens_vm.d/>

module command_line_tokens_vm;

import command_line_tokens_vm_helpers.token_kinds                  : TokenKind, classify_token;
import command_line_tokens_vm_helpers.command_line_meaning_invalid : invalid;
import command_line_tokens_vm_helpers.command_line_meaning_chapter : command_line_meaning_chapter;
import command_line_tokens_vm_helpers.command_line_meaning_page    : command_line_meaning_page;
import command_line_tokens_vm_helpers.command_line_meaning_section : command_line_meaning_section;
import command_line_tokens_vm_helpers.command_line_meaning_tree_descent : command_line_meaning_tree_descent;

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
        assert((letter == '\0') || ('a' <= letter && letter <= 'z'),
               "letter must be in the range 'a'–'z' or be NUL");

        assert(number_major <= 99,
               "number_major must be in the range 0–99");

        assert(number_minor <= 99,
               "number_minor must be in the range 0–99");

        if (letter == '\0')
        {
            assert(number_major == 0,
                   "number_major must be 0 when letter is NUL");

            assert(number_minor == 0,
                   "number_minor must be 0 when letter is NUL");
        }
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

enum Meaning_Source
{
    tree_descent,   // zero-token mode
    token,          // token-generated meaning
    unknown,        // fallback / error / unclassified
}

struct Command_Line_Meaning
{
    bool  is_valid;

    bool  has_chapter;
    bool  has_page;

    ushort chapter;
    ushort page;

    Section_Type section_type;

    NCN ncn;
    CNC cnc;

    Meaning_Source meaning_source;
}

// -------------------------------------------------------------------
// VM
// -------------------------------------------------------------------

struct Command_Line_Tokens_VM
{
    string[]   tokens_lower_cli_args;

    @safe pure nothrow
    Command_Line_Meaning meaning() const
    {
        // --------------------------------------------
        // Zero-token → tree descent (correct meaning)
        // --------------------------------------------
        if (tokens_lower_cli_args.length == 0)
        {
            return command_line_meaning_tree_descent();
        }

        TokenKind[] kinds;
        kinds.length = tokens_lower_cli_args.length;

        foreach (i, t; tokens_lower_cli_args)
        {
            kinds[i] = classify_token(t);
            if (kinds[i] == TokenKind.invalid)
            {
                auto m = invalid();
                m.meaning_source = Meaning_Source.unknown;
                return m;
            }
        }

        // chapter
        if (kinds.length == 1 && kinds[0] == TokenKind.chapter)
        {
            auto m = command_line_meaning_chapter(tokens_lower_cli_args, kinds);
            m.meaning_source = Meaning_Source.token;
            return m;
        }

        // page
        if (kinds.length == 1 && kinds[0] == TokenKind.page)
        {
            auto m = command_line_meaning_page(tokens_lower_cli_args, kinds);
            m.meaning_source = Meaning_Source.token;
            return m;
        }

        // section (NCN/CNC)
        if (kinds.length == 1 && kinds[0] == TokenKind.section)
        {
            auto m = command_line_meaning_section(tokens_lower_cli_args, kinds);
            m.meaning_source = Meaning_Source.token;
            return m;
        }

        auto m = invalid();
        m.meaning_source = Meaning_Source.unknown;
        return m;
    }
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm.d/>
