// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/lowercase_tokens.d/>

module command_line_tokens_vm_helpers.lowercase_tokens;

@safe pure nothrow
string[] lowercase_tokens(in string[] tokens)
{
    string[] tokens_lower;
    tokens_lower.length = tokens.length;

    foreach (i, token; tokens)
    {
        char[] buf = token.dup;
        foreach (j, ch; buf)
            buf[j] = asciiLower(ch);

        tokens_lower[i] = buf.idup;
    }

    return tokens_lower;
}

@safe pure nothrow
char asciiLower(in char c)
{
    return ('A' <= c && c <= 'Z')
        ? cast(char)(c + ('a' - 'A'))
        : c;
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/lowercase_tokens.d/>