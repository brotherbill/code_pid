// Start of Document /</repo:code_pid/src/utilities/is_alpha.d/>

module utilities.is_alpha;

@safe pure nothrow
bool is_alpha(const char c)
{
    // ASCII-only invariant
    return ('a' <= c && c <= 'z') ||
           ('A' <= c && c <= 'Z');
}

// End of Document /</repo:code_pid/src/utilities/is_alpha.d/>
