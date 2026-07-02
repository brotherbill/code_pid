// Start of Document /</repo:code_pid/src/test/command_line_tokens_vm_positive_tests.d/>

module test.command_line_tokens_vm_positive_tests;

import std.stdio     : writeln;
import std.exception : enforce;

import vm.command_line_tokens_vm : Command_Line_Tokens_VM;

import domain.command_line_meaning :
    Command_Line_Meaning,
    Meaning_UI_Mode,
    Section_Type;

// ------------------------------------------------------------
// No CLI args → meaning of tree descent
// ------------------------------------------------------------
void no_cli_args_should_produce_meaning_of_tree_descent ()
{
    // Arrange
    string[] cli_args = [];

    // Act
    auto vm = Command_Line_Tokens_VM.make(cli_args);
    Command_Line_Meaning meaning = vm.meaning();

    // Assert
    assert(meaning.meaning_mode == Meaning_UI_Mode.tree_descent,
        "No CLI args should produce meaning of tree descent.");
}

// ------------------------------------------------------------
// Chapter token → chapter meaning
// ------------------------------------------------------------
void token_c59_should_have_meaning_chapter_59 ()
{
    string[] tokens_lower_cli_args = ["c59"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.chapter == 59);
    assert(meaning.meaning_mode == Meaning_UI_Mode.express_with_token);
}

// ------------------------------------------------------------
// Page token → page meaning
// ------------------------------------------------------------
void token_p7_should_have_meaning_page_7 ()
{
    string[] tokens_lower_cli_args = ["p7"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.page == 7);
    assert(meaning.meaning_mode == Meaning_UI_Mode.express_with_token);
}

// ------------------------------------------------------------
// NCN section token → NCN meaning
// ------------------------------------------------------------
void token_1b2_should_have_meaning_section_ncn ()
{
    string[] tokens_lower_cli_args = ["1b2"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.section_type == Section_Type.ncn);
    assert(meaning.ncn.number_major == 1);
    assert(meaning.ncn.letter == 'b');
    assert(meaning.ncn.number_minor == 2);
    assert(meaning.meaning_mode == Meaning_UI_Mode.express_with_token);
}

// ------------------------------------------------------------
// CNC section token → CNC meaning
// ------------------------------------------------------------
void token_b3a_should_have_meaning_section_cnc ()
{
    string[] tokens_lower_cli_args = ["b3a"];

    auto vm = Command_Line_Tokens_VM(tokens_lower_cli_args);
    auto meaning = vm.meaning();

    assert(meaning.section_type == Section_Type.cnc);
    assert(meaning.cnc.letter_major == 'b');
    assert(meaning.cnc.number == 3);
    assert(meaning.cnc.letter_minor == 'a');
    assert(meaning.meaning_mode == Meaning_UI_Mode.express_with_token);
}

// ------------------------------------------------------------
// unittest block
// ------------------------------------------------------------
unittest
{
    writeln("command_line_tokens_vm_positive_tests: begin");

    no_cli_args_should_produce_meaning_of_tree_descent();
    token_c59_should_have_meaning_chapter_59();
    token_p7_should_have_meaning_page_7();
    token_1b2_should_have_meaning_section_ncn();
    token_b3a_should_have_meaning_section_cnc();

    writeln("command_line_tokens_vm_positive_tests: end");
}

// End of Document /</repo:code_pid/src/test/command_line_tokens_vm_positive_tests.d/>
