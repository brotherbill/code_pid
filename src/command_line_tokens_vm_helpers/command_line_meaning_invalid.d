// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_invalid.d/>

module command_line_tokens_vm_helpers.command_line_meaning_invalid;

import domains.command_line_meaning : Command_Line_Meaning, Section_Type, Meaning_Source;
import domains.section_ncn          : Section_NCN;
import domains.section_cnc          : Section_CNC;

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

    result.meaning_source  = Meaning_Source.unknown;

    return result;
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/command_line_meaning_invalid.d/>
