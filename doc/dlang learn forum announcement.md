# Releasing two small D resources

I’m releasing two small D projects today:

**1. programming-in-d**  
A collection of ~900 small D **code samples** that follow along with Ali Çehreli’s *Programming in D* book.  
Each sample corresponds to an example from the book.

**2. code_pid**  
A simple D app that makes it easy to open any of these code samples in VS Code, already set up for F5 debugging.  
This is Linux-based and tested on **Ubuntu 24.04.5**.

Repos:  
- programming-in-d  
- code_pid  

dmd -g -debug -Isrc $(find src -name "*.d") -of=code_pid
