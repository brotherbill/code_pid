// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_tree_descent.d/>

module command_line_tokens_vm_helpers.command_line_meaning_tree_descent;

import domain.command_line_meaning : Command_Line_Meaning, Section_Type, Meaning_UI_Mode;
import domain.section_ncn          : Section_NCN;
import domain.section_cnc          : Section_CNC;

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
    result.ncn             = Section_NCN.init;
    result.cnc             = Section_CNC.init;

    // Meaning UI mode classification:
    // Tree-descent is structural, not token-derived.
    result.meaning_mode    = Meaning_UI_Mode.tree_descent;

    return result;
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_tree_descent.d/>
