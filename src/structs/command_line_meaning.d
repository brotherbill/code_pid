// Start of Document /</repo:code_pid/src/structs/command_line_meaning.d/>

module structs.command_line_meaning;

import structs.ncn : NCN;
import structs.cnc : CNC;

// -------------------------------------------------------------------
// Canonical domain enums
// -------------------------------------------------------------------

enum Section_Type
{
    none,
    ncn,   // number-major, letter, number-minor
    cnc    // letter-major, number, letter-minor
}

enum Meaning_Source
{
    tree_descent,   // zero-token mode
    token,          // token-generated meaning
    unknown,        // fallback / error / unclassified
}

// -------------------------------------------------------------------
// Canonical meaning struct
// -------------------------------------------------------------------

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

// End of Document /</repo:code_pid/src/structs/command_line_meaning.d/>
