// Start of Document /</repo:code_pid/src/command_line/command_line_meaning_section.d/>

module command_line_tokens_vm_helpers.command_line_meaning_section;

import structs.command_line_meaning : Command_Line_Meaning, Section_Type, Meaning_Source;
import structs.ncn                  : NCN;
import structs.cnc                  : CNC;

import command_line_tokens_vm_helpers.token_kinds : TokenKind;
import command_line_tokens_vm_helpers.command_line_meaning_invalid : invalid;

@safe pure nothrow
Command_Line_Meaning command_line_meaning_section(in string[] tokens_lower,
                                                  in TokenKind[] token_kinds)
{
    // --------------------------------------------
    // Section meaning only applies to exactly one token
    // --------------------------------------------
    if (tokens_lower.length != 1)
        return invalid();

    if (token_kinds.length != 1)
        return invalid();

    if (token_kinds[0] != TokenKind.section)
        return invalid();

    const string s = tokens_lower[0];

    // --------------------------------------------
    // Section domain invariant:
    // ASCII letters + digits only
    // Already guaranteed by classifier, but re-checking is cheap
    // --------------------------------------------
    bool has_alpha = false;
    bool has_digit = false;

    foreach (ch; s)
    {
        import utilities.is_alpha : is_alpha;
        import utilities.is_digit : is_digit;

        if (is_alpha(ch)) has_alpha = true;
        else if (is_digit(ch)) has_digit = true;
        else return invalid();
    }

    // Must contain at least one letter
    if (!has_alpha)
        return invalid();

    // --------------------------------------------
    // Section_Type classification
    // --------------------------------------------
    Section_Type st;

    if (has_alpha && !has_digit)
        st = Section_Type.ncn;
    else
        st = Section_Type.cnc;

    // --------------------------------------------
    // Construct meaning
    // --------------------------------------------
    Command_Line_Meaning result;

    result.is_valid        = true;

    result.has_chapter     = false;
    result.has_page        = false;

    result.chapter         = 0;
    result.page            = 0;

    result.section_type    = st;

    // Initialize NCN/CNC fields
    result.ncn = NCN.init;
    result.cnc = CNC.init;

    result.meaning_source  = Meaning_Source.token;

    return result;
}

// End of Document /</repo:code_pid/src/command_line/command_line_meaning_section.d/>
