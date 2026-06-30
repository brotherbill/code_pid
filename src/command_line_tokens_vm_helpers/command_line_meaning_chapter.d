// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_chapter.d/>

module command_line_tokens_vm_helpers.command_line_meaning_chapter;

import command_line_tokens_vm                                      : Command_Line_Meaning, Section_Type;
import command_line_tokens_vm_helpers.command_line_meaning_invalid : invalid;
import command_line_tokens_vm_helpers.token_kinds                  : TokenKind;

@safe pure nothrow
Command_Line_Meaning command_line_meaning_chapter(in string[] tokens_lower, in TokenKind[] token_kinds)
{
    // Chapter domain invariant
    enum ubyte MAX_CHAPTER = 90;

    // --------------------------------------------
    // Case 1: prefixed chapter token: cNN
    // --------------------------------------------
    if (tokens_lower.length == 1 && token_kinds[0] == TokenKind.chapter)
    {
        import std.conv : to;

        ubyte chapter;

        try
        {
            string chapter_token = tokens_lower[0];
            // strip leading 'c'
            chapter = chapter_token[1 .. $].to!ubyte;
        }
        catch (Exception)
        {
            //return Command_Line_Meaning.init;
            return invalid();
        }

        if (chapter < 1 || chapter > MAX_CHAPTER)
            return Command_Line_Meaning.init;

        Command_Line_Meaning result;
        result.is_valid        = true;
        result.is_tree_descent = false;
        result.has_chapter     = true;
        result.has_page        = false;
        result.chapter         = chapter;
        result.section_type    = Section_Type.none;
        return result;
    }

    // --------------------------------------------
    // Case 2: naked numeric token: NN
    // Chapter concern only checks chapter domain.
    // Page concern will handle page meaning separately.
    // --------------------------------------------
    if (tokens_lower.length == 1 && token_kinds[0] == TokenKind.chapter)
    {
        import std.conv : to;

        ubyte chapter;

        try
        {
            chapter = tokens_lower[0].to!ubyte;
        }
        catch (Exception)
        {
            return Command_Line_Meaning.init;
        }

        // Naked numeric is a chapter only if <= MAX_CHAPTER
        if (chapter < 1 || chapter > MAX_CHAPTER)
            return Command_Line_Meaning.init;

        Command_Line_Meaning result;
        result.is_valid        = true;
        result.is_tree_descent = false;
        result.has_chapter     = true;
        result.has_page        = false;   // page concern handles page meaning
        result.chapter         = chapter;
        result.section_type    = Section_Type.none;
        return result;
    }

    // --------------------------------------------
    // Not a chapter meaning
    // --------------------------------------------
    return Command_Line_Meaning.init;
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_chapter.d/>