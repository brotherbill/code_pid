// Start of Document /</repo:code_pid/src/domains/section_ncn.d/>

module domains.section_ncn;

private enum NUL = '\0';  // NUL character to indicate missing letter

struct Section_NCN
{
    // 0 and NUL are used to indicate missing values for the number and letter components, respectively.
    ubyte number_major;  // 0–99
    char  letter;        // 'a'–'z' or NUL ('\0')
    ubyte number_minor;  // 0–99

    @safe pure nothrow
    static Section_NCN from_token(const string s)
    {
        Section_NCN result;

        // Empty token → empty NCN
        if (s.length == 0)
            return Section_NCN.init;

        size_t i = 0;

        // parse number_major
        ubyte major = 0;
        while (i < s.length && s[i] >= '0' && s[i] <= '9')
        {
            major = cast(ubyte)(major * 10 + (s[i] - '0'));
            i++;
        }
        result.number_major = major;

        // optional letter
        if (i < s.length && s[i] >= 'a' && s[i] <= 'z')
        {
            result.letter = s[i];
            i++;
        }
        else
        {
            result.letter = NUL;
        }

        // optional number_minor
        ubyte minor = 0;
        while (i < s.length && s[i] >= '0' && s[i] <= '9')
        {
            minor = cast(ubyte)(minor * 10 + (s[i] - '0'));
            i++;
        }
        result.number_minor = minor;

        return result;
    }

    invariant
    {
        assert(number_major <= 99,
               "number_major must be in the range 0–99");

        assert((letter == NUL) || ('a' <= letter && letter <= 'z'),
               "letter must be in the range 'a'–'z' or be NUL");

        assert(number_minor <= 99,
               "number_minor must be in the range 0–99");

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

// End of Document /</repo:code_pid/src/domains/section_ncn.d/>
