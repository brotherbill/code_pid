// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_is_tree_descent.d/>

module command_line_tokens_vm_helpers.command_line_meaning_is_tree_descent;

import command_line_tokens_vm : Command_Line_Meaning, Section_Type, NCN, CNC;

@safe pure nothrow
Command_Line_Meaning command_line_meaning_is_tree_descent()
{
    Command_Line_Meaning result;

    result.is_valid        = true;
    result.is_tree_descent = true;
    result.has_chapter     = false;
    result.has_page        = false;
    result.chapter         = 0;
    result.page            = 0;
    result.section_type    = Section_Type.none;
    result.ncn             = NCN.init;
    result.cnc             = CNC.init;

    return result;
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_is_tree_descent.d/>
