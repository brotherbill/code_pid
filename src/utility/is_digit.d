// Start of Document /</repo:code_pid/src/utilities/is_digit.d/>

module utilities.is_digit;

@safe pure nothrow
bool is_digit(const char c)
{
    // ASCII-only invariant
    return '0' <= c && c <= '9';
}

// End of Document /</repo:code_pid/src/utilities/is_digit.d/>
