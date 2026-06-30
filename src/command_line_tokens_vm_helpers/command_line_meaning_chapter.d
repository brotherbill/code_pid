// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_chapter.d/>

module command_line_tokens_vm_helpers.command_line_meaning_chapter;

import command_line_tokens_vm                                      : Command_Line_Meaning, Section_Type, Meaning_Source;
import command_line_tokens_vm_helpers.command_line_meaning_invalid : invalid;
import command_line_tokens_vm_helpers.token_kinds                  : TokenKind;

@safe pure nothrow
Command_Line_Meaning command_line_meaning_chapter(in string[] tokens_lower,
                                                  in TokenKind[] token_kinds)
{
    enum ubyte MAX_CHAPTER = 90;

    // --------------------------------------------
    // Case 1: prefixed chapter token: cNN
    // --------------------------------------------
    if (tokens_lower.length == 1 &&
        token_kinds[0] == TokenKind.chapter &&
        tokens_lower[0].length >= 2 &&
        tokens_lower[0][0] == 'c')
    {
        import std.conv : to;

        ubyte chapter;

        try
        {
            // strip leading 'c'
            chapter = tokens_lower[0][1 .. $].to!ubyte;
        }
        catch (Exception)
        {
            return invalid();
        }

        if (chapter < 1 || chapter > MAX_CHAPTER)
            return invalid();

        Command_Line_Meaning result;
        result.is_valid        = true;
        result.has_chapter     = true;
        result.has_page        = false;
        result.chapter         = chapter;
        result.section_type    = Section_Type.none;

        result.meaning_source  = Meaning_Source.token;
        return result;
    }

    // --------------------------------------------
    // Case 2: naked numeric token: NN
    // --------------------------------------------
    if (tokens_lower.length == 1 &&
        token_kinds[0] == TokenKind.chapter &&
        (tokens_lower[0].length >= 1 && tokens_lower[0][0] != 'c'))
    {
        import std.conv : to;

        ubyte chapter;

        try
        {
            chapter = tokens_lower[0].to!ubyte;
        }
        catch (Exception)
        {
            return invalid();
        }

        if (chapter < 1 || chapter > MAX_CHAPTER)
            return invalid();

        Command_Line_Meaning result;
        result.is_valid        = true;
        result.has_chapter     = true;
        result.has_page        = false;
        result.chapter         = chapter;
        result.section_type    = Section_Type.none;

        result.meaning_source  = Meaning_Source.token;
        return result;
    }

    // --------------------------------------------
    // Not a chapter meaning
    // --------------------------------------------
    return invalid();
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_chapter.d/>
