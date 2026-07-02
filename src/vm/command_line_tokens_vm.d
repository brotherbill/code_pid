// Start of Document /</repo:code_pid/src/vm/command_line_tokens_vm.d/>

module vm.command_line_tokens_vm;

import command_line_tokens_vm_helpers.token_kinds                  : TokenKind, classify_token;
import command_line_tokens_vm_helpers.command_line_meaning_invalid : invalid;
import command_line_tokens_vm_helpers.command_line_meaning_chapter : command_line_meaning_chapter;
import command_line_tokens_vm_helpers.command_line_meaning_page    : command_line_meaning_page;
import command_line_tokens_vm_helpers.command_line_meaning_section : command_line_meaning_section;
import command_line_tokens_vm_helpers.command_line_meaning_tree_descent : command_line_meaning_tree_descent;

// canonical NCN/CNC
import domains.section_ncn : Section_NCN;
import domains.section_cnc : Section_CNC;

// canonical meaning types (struct + enums)
import domains.command_line_meaning : Command_Line_Meaning, Section_Type, Meaning_Source;

struct Command_Line_Tokens_VM
{
    // After construction, these *are* tokens.
    string[] tokens_lower_cli_args;

    // ------------------------------------------------------------
    // Explicit construction: static make ()
    // ------------------------------------------------------------
    @safe pure nothrow
    static Command_Line_Tokens_VM make (string[] lower_cli_args)
    {
        Command_Line_Tokens_VM vm;
        vm.tokens_lower_cli_args = lower_cli_args;
        return vm;
    }

    // ------------------------------------------------------------
    // Meaning computation
    // ------------------------------------------------------------
    @safe pure nothrow
    Command_Line_Meaning meaning () const
    {
        // Zero tokens → tree descent
        if (tokens_lower_cli_args.length == 0)
        {
            return command_line_meaning_tree_descent ();
        }

        // Classify tokens
        TokenKind[] kinds;
        kinds.length = tokens_lower_cli_args.length;

        foreach (i, raw_arg; tokens_lower_cli_args)
        {
            kinds[i] = classify_token (raw_arg);

            if (kinds[i] == TokenKind.invalid)
            {
                Command_Line_Meaning m = invalid ();
                m.meaning_source = Meaning_Source.unknown;
                return m;
            }
        }

        // Single-token meanings
        if (kinds.length == 1 && kinds[0] == TokenKind.chapter)
        {
            Command_Line_Meaning m = command_line_meaning_chapter (tokens_lower_cli_args, kinds);
            m.meaning_source = Meaning_Source.token;
            return m;
        }

        if (kinds.length == 1 && kinds[0] == TokenKind.page)
        {
            Command_Line_Meaning m = command_line_meaning_page (tokens_lower_cli_args, kinds);
            m.meaning_source = Meaning_Source.token;
            return m;
        }

        if (kinds.length == 1 && kinds[0] == TokenKind.section)
        {
            Command_Line_Meaning m = command_line_meaning_section (tokens_lower_cli_args, kinds);
            m.meaning_source = Meaning_Source.token;
            return m;
        }

        // Multi-token → invalid
        Command_Line_Meaning m = invalid ();
        m.meaning_source = Meaning_Source.unknown;
        return m;
    }
}

// End of Document /</repo:code_pid/src/vm/command_line_tokens_vm.d/>
