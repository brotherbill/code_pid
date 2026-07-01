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
// Canonical meaning struct + real invariants
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

    void enforceInvalidInvariants() const
    {
        assert(!is_valid,                         "invalid meaning must have is_valid == false");
        assert(!has_chapter,                      "invalid meaning must not have chapter");
        assert(!has_page,                         "invalid meaning must not have page");
        assert(chapter      == 0,                 "invalid meaning must have chapter == 0");
        assert(page         == 0,                 "invalid meaning must have page == 0");
        assert(section_type == Section_Type.none, "invalid meaning must have section_type == none");
        assert(ncn          == NCN.init,          "invalid meaning must have ncn == NCN.init");
        assert(cnc          == CNC.init,          "invalid meaning must have cnc == CNC.init");
        assert(meaning_source == Meaning_Source.unknown,
                                                  "invalid meaning must have meaning_source == unknown");
    }

    invariant
    {
        // INVALID meaning → everything neutral
        if (!is_valid)
        {
            enforceInvalidInvariants();
            return;
        }

        // CHAPTER meaning - chapter must be in [1, 90]
        if (has_chapter)
        {
            assert(0 < chapter && chapter <= 90, "chapter must be in [1, 90]");
        }

        // PAGE meaning — page must be in [1, 999]
        if (has_page)
        {
            assert(0 < page && page <= 999, "page must be in [1, 999]");
        }

        // SECTION meaning
        final switch (section_type)
        {
            case Section_Type.none:
                assert(ncn == NCN.init, "section_type none must have ncn == NCN.init");
                assert(cnc == CNC.init, "section_type none must have cnc == CNC.init");
                break;

            case Section_Type.ncn:
                assert(ncn != NCN.init, "section_type ncn must have ncn != NCN.init");
                assert(cnc == CNC.init, "section_type ncn must have cnc == CNC.init");
                break;

            case Section_Type.cnc:
                assert(cnc != CNC.init, "section_type cnc must have cnc != CNC.init");
                assert(ncn == NCN.init, "section_type cnc must have ncn == NCN.init");
                break;
        }

        // MEANING SOURCE invariants
        final switch (meaning_source)
        {
            case Meaning_Source.tree_descent:
                assert(is_valid,                          "meaning_source tree_descent must be valid");
                assert(!has_chapter,                      "meaning_source tree_descent must not have chapter");
                assert(!has_page,                         "meaning_source tree_descent must not have page");
                assert(section_type == Section_Type.none, "meaning_source tree_descent must have section_type == Section_Type.none");
                assert(chapter      == 0,                 "meaning_source tree_descent must have chapter == 0");
                assert(page         == 0,                 "meaning_source tree_descent must have page == 0");
                assert(ncn          == NCN.init,          "meaning_source tree_descent must have ncn == NCN.init");
                assert(cnc          == CNC.init,          "meaning_source tree_descent must have cnc == CNC.init");
                break;

            case Meaning_Source.token:
                // token meaning must be valid
                assert(is_valid, "token meaning must be valid");

                // must have chapter or page (or both)
                assert(has_chapter || has_page,
                       "token meaning must have chapter or page (or both)");

                // section_type is orthogonal; its own invariants live elsewhere
                break;

            case Meaning_Source.unknown:
                enforceInvalidInvariants();
                break;
        }
    }
}

// End of Document /</repo:code_pid/src/structs/command_line_meaning.d/>
