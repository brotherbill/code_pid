// Start of Document /</repo:code_pid/src/command_line/command_line_meaning_page.d/>

module command_line_tokens_vm_helpers.command_line_meaning_page;

import command_line_tokens_vm                     : Command_Line_Meaning, Section_Type;
import command_line_tokens_vm_helpers.token_kinds : TokenKind;
import command_line_tokens_vm_helpers.command_line_meaning_invalid : invalid;

@safe pure nothrow
Command_Line_Meaning command_line_meaning_page(in string[] tokens_lower,
                                               in TokenKind[] token_kinds)
{
    // Page domain invariant
    enum ushort MAX_PAGE = 999;

    // --------------------------------------------
    // Case 1: prefixed page token: pNN
    // --------------------------------------------
    if (tokens_lower.length == 1 && token_kinds[0] == TokenKind.page)
    {
        import std.conv : to;

        ushort page;

        try
        {
            string page_token = tokens_lower[0];
            // strip leading 'p'
            page = page_token[1 .. $].to!ushort;
        }
        catch (Exception)
        {
            return invalid();
        }

        if (page < 1 || page > MAX_PAGE)
            return invalid();

        Command_Line_Meaning result;
        result.is_valid        = true;
        result.is_tree_descent = false;
        result.has_chapter     = false;
        result.has_page        = true;
        result.chapter         = 0;
        result.page            = page;
        result.section_type    = Section_Type.none;
        return result;
    }

    // --------------------------------------------
    // Case 2: naked numeric page: NN (91–999)
    // --------------------------------------------
    if (tokens_lower.length == 1 &&
        token_kinds[0] == TokenKind.page)
    {
        import std.conv : to;

        ushort page;

        try
        {
            page = tokens_lower[0].to!ushort;
        }
        catch (Exception)
        {
            return invalid();
        }

        // Naked page domain invariant
        if (page < 91 || page > MAX_PAGE)
            return invalid();

        Command_Line_Meaning result;
        result.is_valid        = true;
        result.is_tree_descent = false;
        result.has_chapter     = false;
        result.has_page        = true;
        result.chapter         = 0;
        result.page            = page;
        result.section_type    = Section_Type.none;
        return result;
    }

    // --------------------------------------------
    // Anything else is invalid for page meaning
    // --------------------------------------------
    return invalid();
}

// End of Document /</repo:code_pid/src/command_line/command_line_meaning_page.d/>