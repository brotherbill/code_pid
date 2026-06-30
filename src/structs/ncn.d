// Start of Document /</repo:code_pid/src/structs/ncn.d/>

module structs.ncn;

private enum NUL = '\0';  // NUL character to indicate missing letter

struct NCN
{
    // 0 and NUL are used to indicate missing values for the number and letter components, respectively.
    ubyte number_major;  // 0–99
    char  letter;        // 'a'–'z' or NUL ('\0')
    ubyte number_minor;  // 0–99

    invariant
    {
        assert(number_major <= 99,
               "number_major must be in the range 0–99");

        assert((letter == NUL) || ('a' <= letter && letter <= 'z'),
               "letter must be in the range 'a'–'z' or be NUL");

        assert(number_minor <= 99,
               "number_minor must be in the range 0–99");

        // ------------------------------------------------------------------
        // Semantic completeness rules (corrected, no drift)
        // ------------------------------------------------------------------

        // Rule 1:
        // If number_major is missing (0),
        // then letter and number_minor must also be missing.
        if (number_major == 0)
        {
            assert(letter == NUL,
                   "letter must be NUL when number_major is 0");

            assert(number_minor == 0,
                   "number_minor must be 0 when number_major is 0");
        }

        // Rule 2:
        // If letter is NUL,
        // then number_minor must also be missing (0).
        if (letter == NUL)
        {
            assert(number_minor == 0,
                   "number_minor must be 0 when letter is NUL");
        }

        // Rule 3:
        // If letter is present, number_major must be present.
        if (letter != NUL)
        {
            assert(number_major != 0,
                   "number_major must be non-zero when letter is present");
        }
    }
}

// End of Document /</repo:code_pid/src/structs/ncn.d/>
