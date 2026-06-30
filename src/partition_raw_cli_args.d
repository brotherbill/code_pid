// Start of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/partition_raw_cli_args.d/>

module command_line_tokens_vm_helpers.partition_raw_cli_args;

import utilities.to_lower : to_lower;

@safe pure nothrow
struct Parts
{
    string[] tokens_raw_cli_args;
    string[] options_raw_cli_args;
}

@safe pure nothrow
Parts partition_raw_cli_args(in string[] cli_raw_args)
{
    Parts result;

    foreach (arg; cli_raw_args)
    {
        // discard empty args
        if (arg.length == 0)
            continue;

        // lowercase early (correct architectural location)
        auto lower = to_lower(arg);

        // classify option vs token
        if (lower[0] == '-')
            result.options_raw_cli_args ~= lower;
        else
            result.tokens_raw_cli_args ~= lower;
    }

    return result;
}

// End of Document /</repo:code_pid/src/command_line_tokens_vm_helpers/partition_raw_cli_args.d/>
