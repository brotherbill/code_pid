// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/validate_tokens_character_set.d/>

module command_line_tokens_vm_helpers.validate_tokens_character_set;

@safe pure nothrow
bool validate_tokens_character_set(in string[] tokens_lower)
{
    foreach (token; tokens_lower)
    foreach (ch; token)
    {
        const bool ok =
            ('0' <= ch && ch <= '9') ||
            ('a' <= ch && ch <= 'z') ||
            ch == '.' ||
            ch == '-' ||
            ch == '_' ||
            ch == ' ';

        if (!ok)
            return false;
    }
    return true;
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/validate_tokens_character_set.d/>