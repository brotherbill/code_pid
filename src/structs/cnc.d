// Start of Document /</repo:code_pid/src/structs/cnc.d/>

module structs.cnc;

private enum NUL = '\0';  // NUL character to indicate missing letter

struct CNC
{
    // NUL and 0 are used to indicate missing values for the letter and number components, respectively.
    char  letter_major;  // 'a'–'z' or NUL ('\0')
    ubyte number;        // 0–99
    char  letter_minor;  // 'a'–'z' or NUL ('\0')

    invariant
    {
        // Domain ranges
        assert((letter_major == NUL) || ('a' <= letter_major && letter_major <= 'z'),
               "letter_major must be in the range 'a'–'z' or be NUL");

        assert(number <= 99,
               "number must be in the range 0–99");

        assert((letter_minor == NUL) || ('a' <= letter_minor && letter_minor <= 'z'),
               "letter_minor must be in the range 'a'–'z' or be NUL");

        // ------------------------------------------------------------------
        // Semantic completeness rules (symmetry with NCN)
        // ------------------------------------------------------------------

        // Rule 1:
        // If letter_major is missing (NUL),
        // then number and letter_minor must also be missing.
        if (letter_major == NUL)
        {
            assert(number == 0,
                   "number must be 0 when letter_major is NUL");

            assert(letter_minor == NUL,
                   "letter_minor must be NUL when letter_major is NUL");
        }

        // Rule 2:
        // If number is missing (0),
        // then letter_minor must also be missing (NUL).
        if (number == 0)
        {
            assert(letter_minor == NUL,
                   "letter_minor must be NUL when number is 0");
        }

        // Rule 3:
        // If letter_minor is present,
        // then number must be present.
        if (letter_minor != NUL)
        {
            assert(number != 0,
                   "number must be non-zero when letter_minor is present");
        }

        // Rule 4:
        // If number is present,
        // then letter_major must be present.
        if (number != 0)
        {
            assert(letter_major != NUL,
                   "letter_major must be non-NUL when number is present");
        }
    }
}

// End of Document /</repo:code_pid/src/structs/cnc.d/>