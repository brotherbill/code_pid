// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_invalid.d/>

module command_line_tokens_vm_helpers.command_line_meaning_invalid;

import domain.command_line_meaning : Command_Line_Meaning, Section_Type, Meaning_UI_Mode;
import domain.section_ncn          : Section_NCN;
import domain.section_cnc          : Section_CNC;

@safe pure nothrow
Command_Line_Meaning invalid()
{
    Command_Line_Meaning result;

    result.is_valid        = false;
    result.has_chapter     = false;
    result.has_page        = false;
    result.chapter         = 0;
    result.page            = 0;
    result.section_type    = Section_Type.none;
    result.ncn             = Section_NCN.init;
    result.cnc             = Section_CNC.init;

    result.meaning_mode    = Meaning_UI_Mode.invalid;

    return result;
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_invalid.d/>
