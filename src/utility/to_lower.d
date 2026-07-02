// Start of Document /</repo:code_pid/src/utilities/to_lower.d/>

module utilities.to_lower;

@safe pure nothrow
string to_lower(const string s)
{
    // duplicate so we can mutate safely
    auto result = s.dup;

    foreach (i, c; result)
    {
        // ASCII-only lowercase conversion
        if ('A' <= c && c <= 'Z')
        {
            result[i] = cast(char)(c + ('a' - 'A'));
        }
    }

    return result;
}

// End of Document /</repo:code_pid/src/utilities/to_lower.d/>
