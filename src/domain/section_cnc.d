// Start of Document /\<repo:code_pid/src/domains/section_cnc.d\>/

module domains.section_cnc;

private enum NUL = '\0';  // NUL character to indicate missing letter

struct Section_CNC
{
    char  letter_major;  // 'a'–'z' or NUL ('\0')
    ubyte number;        // 0–99
    char  letter_minor;  // 'a'–'z' or NUL ('\0')

    @safe pure nothrow
    static Section_CNC from_token(const string s)
    {
        Section_CNC result;

        // Empty token → empty CNC
        if (s.length == 0)
            return Section_CNC.init;

        // major letter
        result.letter_major = s[0];

        // parse digits
        size_t i = 1;
        ubyte num = 0;

        while (i < s.length && s[i] >= '0' && s[i] <= '9')
        {
            num = cast(ubyte)(num * 10 + (s[i] - '0'));
            i++;
        }

        result.number = num;

        // optional minor letter
        if (i < s.length)
            result.letter_minor = s[i];
        else
            result.letter_minor = NUL;

        return result;
    }

    invariant
    {
        assert((letter_major == NUL) || ('a' <= letter_major && letter_major <= 'z'),
               "letter_major must be in the range 'a'–'z' or be NUL");

        assert(number <= 99,
               "number must be in the range 0–99");

        assert((letter_minor == NUL) || ('a' <= letter_minor && letter_minor <= 'z'),
               "letter_minor must be in the range 'a'–'z' or be NUL");

        if (letter_major == NUL)
        {
            assert(number == 0,
                   "number must be 0 when letter_major is NUL");

            assert(letter_minor == NUL,
                   "letter_minor must be NUL when letter_major is NUL");
        }

        if (number == 0)
        {
            assert(letter_minor == NUL,
                   "letter_minor must be NUL when number is 0");
        }

        if (letter_minor != NUL)
        {
            assert(number != 0,
                   "number must be non-zero when letter_minor is present");
        }

        if (number != 0)
        {
            assert(letter_major != NUL,
                   "letter_major must be non-NUL when number is present");
        }
    }
}

// End of Document /\<repo:code_pid/src/domains/section_cnc.d\>/
