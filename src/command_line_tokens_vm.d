// Start of Document /</repo:code_pid/src/command_line_tokens_vm.d/>

module command_line_tokens_vm;

import command_line_tokens_vm_helpers.token_kinds                  : TokenKind, classify_token;
import command_line_tokens_vm_helpers.command_line_meaning_invalid : invalid;
import command_line_tokens_vm_helpers.command_line_meaning_chapter : command_line_meaning_chapter;
import command_line_tokens_vm_helpers.command_line_meaning_page    : command_line_meaning_page;
import command_line_tokens_vm_helpers.command_line_meaning_section : command_line_meaning_section;
import command_line_tokens_vm_helpers.command_line_meaning_tree_descent : command_line_meaning_tree_descent;

// canonical NCN/CNC
import structs.ncn : NCN;
import structs.cnc : CNC;

// canonical meaning types (struct + enums)
import structs.command_line_meaning : Command_Line_Meaning, Section_Type, Meaning_Source;

struct Command_Line_Tokens_VM
{
    string[]   tokens_lower_cli_args;

    @safe pure nothrow
    Command_Line_Meaning meaning() const
    {
        if (tokens_lower_cli_args.length == 0)
        {
            return command_line_meaning_tree_descent();
        }

        TokenKind[] kinds;
        kinds.length = tokens_lower_cli_args.length;

        foreach (i, t; tokens_lower_cli_args)
        {
            kinds[i] = classify_token(t);
            if (kinds[i] == TokenKind.invalid)
            {
                auto m = invalid();
                m.meaning_source = Meaning_Source.unknown;
                return m;
            }
        }

        if (kinds.length == 1 && kinds[0] == TokenKind.chapter)
        {
            auto m = command_line_meaning_chapter(tokens_lower_cli_args, kinds);
            m.meaning_source = Meaning_Source.token;
            return m;
        }

        if (kinds.length == 1 && kinds[0] == TokenKind.page)
        {
            auto m = command_line_meaning_page(tokens_lower_cli_args, kinds);
            m.meaning_source = Meaning_Source.token;
            return m;
        }

        if (kinds.length == 1 && kinds[0] == TokenKind.section)
        {
            auto m = command_line_meaning_section(tokens_lower_cli_args, kinds);
            m.meaning_source = Meaning_Source.token;
            return m;
        }

        auto m = invalid();
        m.meaning_source = Meaning_Source.unknown;
        return m;
    }
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm.d/>
