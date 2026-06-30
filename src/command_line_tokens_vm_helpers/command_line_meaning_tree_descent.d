// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_tree_descent.d/>

module command_line_tokens_vm_helpers.command_line_meaning_tree_descent;

import command_line_tokens_vm : Command_Line_Meaning, Section_Type, NCN, CNC, Meaning_Source;

@safe pure nothrow
Command_Line_Meaning command_line_meaning_tree_descent()
{
    // --------------------------------------------
    // Tree-descent meaning:
    //
    // Triggered when the user supplies zero tokens.
    // This is the CLI's default meaning, representing
    // a descent into the command tree rather than a
    // chapter/page/section meaning.
    // --------------------------------------------

    Command_Line_Meaning result;

    result.is_valid        = true;

    // No chapter/page/section meaning
    result.has_chapter     = false;
    result.has_page        = false;
    result.chapter         = 0;
    result.page            = 0;

    result.section_type    = Section_Type.none;
    result.ncn             = NCN.init;
    result.cnc             = CNC.init;

    // Meaning source classification:
    // Tree-descent is not token-derived; it is structural.
    result.meaning_source  = Meaning_Source.tree_descent;

    return result;
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_tree_descent.d/>
