// Start of Document /</repo:code_pid/src/structs/command_line_meaning.d/>

module structs.command_line_meaning;

import structs.ncn : NCN;
import structs.cnc : CNC;

private enum NUL = '\0';

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

    // ---------------------------------------------------------------
    // INVALID meaning invariants — everything neutral
    // ---------------------------------------------------------------
    private void enforceInvalidInvariants() const
    {
        assert(!is_valid,                         "invalid meaning must have is_valid == false");
        assert(!has_chapter,                      "invalid meaning must not have chapter");
        assert(!has_page,                         "invalid meaning must not have page");
        assert(chapter      == 0,                 "invalid meaning must have chapter == 0");
        assert(page         == 0,                 "invalid meaning must have page == 0");
        assert(section_type == Section_Type.none, "invalid meaning must have section_type == none");

        // NCN neutral
        assert(ncn.number_major == 0,             "invalid meaning must have NCN number_major == 0");
        assert(ncn.letter       == NUL,           "invalid meaning must have NCN letter == NUL");
        assert(ncn.number_minor == 0,             "invalid meaning must have NCN number_minor == 0");

        // CNC neutral
        assert(cnc.letter_major == NUL,           "invalid meaning must have CNC letter_major == NUL");
        assert(cnc.number       == 0,             "invalid meaning must have CNC number == 0");
        assert(cnc.letter_minor == NUL,           "invalid meaning must have CNC letter_minor == NUL");

        assert(meaning_source == Meaning_Source.unknown,
                                                  "invalid meaning must have meaning_source == unknown");
    }

    // ---------------------------------------------------------------
    // CHAPTER domain enforcement
    // ---------------------------------------------------------------
    private void enforceChapterDomain() const
    {
        if (has_chapter)
        {
            assert(0 < chapter && chapter <= 90,
                   "has_chapter means that chapter is between 1 and 90");
        }
        else
        {
            assert(chapter == 0,
                   "has_chapter == false means that chapter is 0");
        }
    }

    // ---------------------------------------------------------------
    // PAGE domain enforcement
    // ---------------------------------------------------------------
    private void enforcePageDomain() const
    {
        if (has_page)
        {
            assert(0 < page && page <= 999,
                   "has_page means that page is between 1 and 999");
        }
        else
        {
            assert(page == 0,
                   "has_page == false means that page is 0");
        }
    }

    // ---------------------------------------------------------------
    // SECTION domain enforcement — NONE
    // ---------------------------------------------------------------
    private void enforceSectionNoneDomain() const
    {
        // NCN neutral
        assert(ncn.number_major == 0,
               "section_type none must have NCN number_major == 0");
        assert(ncn.letter == NUL,
               "section_type none must have NCN letter == NUL");
        assert(ncn.number_minor == 0,
               "section_type none must have NCN number_minor == 0");

        // CNC neutral
        assert(cnc.letter_major == NUL,
               "section_type none must have CNC letter_major == NUL");
        assert(cnc.number == 0,
               "section_type none must have CNC number == 0");
        assert(cnc.letter_minor == NUL,
               "section_type none must have CNC letter_minor == NUL");
    }

    // ---------------------------------------------------------------
    // SECTION domain enforcement — NCN
    // ---------------------------------------------------------------
    private void enforceSectionNCNDomain() const
    {
        // NCN active
        assert(0 < ncn.number_major && ncn.number_major <= 99,
               "section_type ncn must have NCN number_major in [1, 99]");

        if (ncn.letter != NUL)
        {
            assert('a' <= ncn.letter && ncn.letter <= 'z',
                   "section_type ncn must have NCN letter in [a, z]");

            if (ncn.number_minor != 0)
            {
                assert(0 < ncn.number_minor && ncn.number_minor <= 99,
                       "section_type ncn must have NCN number_minor in [1, 99] when non-zero");
            }
        }

        // CNC neutral
        assert(cnc.letter_major == NUL,
               "section_type ncn must have CNC letter_major == NUL");
        assert(cnc.number == 0,
               "section_type ncn must have CNC number == 0");
        assert(cnc.letter_minor == NUL,
               "section_type ncn must have CNC letter_minor == NUL");
    }

    // ---------------------------------------------------------------
    // SECTION domain enforcement — CNC
    // ---------------------------------------------------------------
    private void enforceSectionCNCDomain() const
    {
        // CNC active
        assert('a' <= cnc.letter_major && cnc.letter_major <= 'z',
               "section_type cnc must have CNC letter_major in [a, z]");

        if (cnc.number != 0)
        {
            assert(0 < cnc.number && cnc.number <= 99,
                   "section_type cnc must have CNC number in [1, 99] when non-zero");

            if (cnc.letter_minor != NUL)
            {
                assert('a' <= cnc.letter_minor && cnc.letter_minor <= 'z',
                       "section_type cnc must have CNC letter_minor in [a, z] when non-NUL");
            }
        }

        // NCN neutral
        assert(ncn.number_major == 0,
               "section_type cnc must have NCN number_major == 0");
        assert(ncn.letter == NUL,
               "section_type cnc must have NCN letter == NUL");
        assert(ncn.number_minor == 0,
               "section_type cnc must have NCN number_minor == 0");
    }

    // ---------------------------------------------------------------
    // MEANING SOURCE domain enforcement
    // ---------------------------------------------------------------
    private void enforceMeaningSourceDomain() const
    {
        final switch (meaning_source)
        {
            case Meaning_Source.tree_descent:
                assert(is_valid,
                       "meaning_source tree_descent must be valid");
                assert(!has_chapter,
                       "meaning_source tree_descent must not have chapter");
                assert(!has_page,
                       "meaning_source tree_descent must not have page");
                assert(section_type == Section_Type.none,
                       "meaning_source tree_descent must have section_type == none");
                assert(chapter == 0,
                       "meaning_source tree_descent must have chapter == 0");
                assert(page == 0,
                       "meaning_source tree_descent must have page == 0");

                enforceSectionNoneDomain();
                break;

            case Meaning_Source.token:
                assert(is_valid,
                       "token meaning must be valid");
                assert(has_chapter || has_page,
                       "token meaning must have chapter or page (or both)");
                break;

            case Meaning_Source.unknown:
                enforceInvalidInvariants();
                break;
        }
    }

    // ---------------------------------------------------------------
    // Master invariant — cathedral view
    // ---------------------------------------------------------------
    invariant
    {
        if (!is_valid)
        {
            enforceInvalidInvariants();
            return;
        }

        enforceChapterDomain();
        enforcePageDomain();

        final switch (section_type)
        {
            case Section_Type.none:
                enforceSectionNoneDomain();
                break;

            case Section_Type.ncn:
                enforceSectionNCNDomain();
                break;

            case Section_Type.cnc:
                enforceSectionCNCDomain();
                break;
        }

        enforceMeaningSourceDomain();
    }
}

// End of Document /</repo:code_pid/src/structs/command_line_meaning.d/>
