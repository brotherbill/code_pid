// Start of Document /</repo:code_pid/src/test/command_line_tokens_vm_negative_tests.d/>

module test.command_line_tokens_vm_negative_tests;

import std.stdio     : writeln;
import std.exception : Exception;

import vm.command_line_tokens_vm : Command_Line_Tokens_VM;

import domain.command_line_meaning :
    Command_Line_Meaning,
    Meaning_UI_Mode;

// ------------------------------------------------------------
// Invalid token → invalid()
// ------------------------------------------------------------
void invalid_token_should_produce_invalid_meaning()
{
    string[] tokens_lower_cli_args = ["%%%"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.meaning_mode == Meaning_UI_Mode.invalid,
        "Invalid token should produce invalid meaning.");
}

// ------------------------------------------------------------
// Malformed section token (abc) → invalid()
// ------------------------------------------------------------
void malformed_section_abc_should_produce_invalid_meaning()
{
    string[] tokens_lower_cli_args = ["abc"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.meaning_mode == Meaning_UI_Mode.invalid,
        "Malformed section token should produce invalid meaning.");
}

// ------------------------------------------------------------
// Two valid tokens (c1 p1) → invalid()
// ------------------------------------------------------------
void two_tokens_c1_p1_should_produce_invalid_meaning()
{
    string[] tokens_lower_cli_args = ["c1", "p1"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.meaning_mode == Meaning_UI_Mode.invalid,
        "Two valid tokens (c1 p1) must produce invalid meaning.");
}

// ------------------------------------------------------------
// Two tokens (general case) → invalid()
// ------------------------------------------------------------
void two_tokens_should_produce_invalid_meaning()
{
    string[] tokens_lower_cli_args = ["c59", "p7"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.meaning_mode == Meaning_UI_Mode.invalid,
        "Two tokens should produce invalid meaning.");
}

// ------------------------------------------------------------
// Three tokens → invalid()
// ------------------------------------------------------------
void three_tokens_should_produce_invalid_meaning()
{
    string[] tokens_lower_cli_args = ["c59", "p7", "1c3"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.meaning_mode == Meaning_UI_Mode.invalid,
        "Three tokens should produce invalid meaning.");
}

// ------------------------------------------------------------
// Valid-looking token but classify_token returns invalid
// ------------------------------------------------------------
void valid_looking_token_with_invalid_kind_should_produce_invalid_meaning()
{
    string[] tokens_lower_cli_args = ["cxx"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.meaning_mode == Meaning_UI_Mode.invalid,
        "Token that classifies as invalid should produce invalid meaning.");
}

// ------------------------------------------------------------
// unittest block
// ------------------------------------------------------------
unittest
{
    writeln("command_line_tokens_vm_negative_tests: begin");

    invalid_token_should_produce_invalid_meaning();
    malformed_section_abc_should_produce_invalid_meaning();
    two_tokens_c1_p1_should_produce_invalid_meaning();
    two_tokens_should_produce_invalid_meaning();
    three_tokens_should_produce_invalid_meaning();
    valid_looking_token_with_invalid_kind_should_produce_invalid_meaning();

    writeln("command_line_tokens_vm_negative_tests: end");
}

// End of Document /</repo:code_pid/src/test/command_line_tokens_vm_negative_tests.d/>
