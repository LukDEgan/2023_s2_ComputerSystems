#include <iostream>
#include <list>

#include "CompilerParser.h"
#include "Token.h"

using namespace std;

int main(int argc, char* argv[]) {
  /* Tokens for:
   *     class MyClass {
   *          static int a, b;
   *          field char name;
   *          method int add (int param1, int param2) {
   *               var int a;
   *               let a = param1 + param2;
   *               return a;
   *          }
   *          method int power (int param1, int param2) {
   *               var int a;
   *               while ( param2 > 0){
   *               let a = a * param1;
   *               let param2 = param2 - 1;
   *               }
   *               return a;
   *          }
   *          method void test () {
   *               var int a;
   *               let a = skip;
   *               do skip;
   *               if (skip){
   *               {
   *               } else {
   *               }
   *               return;
   *          }
   *
   *     }
   */
  list<Token*> tokens;

  tokens.push_back(new Token("keyword", "class"));
  tokens.push_back(new Token("identifier", "MyClass"));
  tokens.push_back(new Token("symbol", "{"));

  tokens.push_back(new Token("keyword", "static"));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", ","));
  tokens.push_back(new Token("identifier", "b"));
  tokens.push_back(new Token("symbol", ";"));

  tokens.push_back(new Token("keyword", "field"));
  tokens.push_back(new Token("keyword", "char"));
  tokens.push_back(new Token("identifier", "name"));
  tokens.push_back(new Token("symbol", ";"));

  tokens.push_back(new Token("keyword", "method"));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "add"));
  tokens.push_back(new Token("symbol", "("));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "param1"));
  tokens.push_back(new Token("symbol", ","));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "param2"));
  tokens.push_back(new Token("symbol", ")"));
  tokens.push_back(new Token("symbol", "{"));
  tokens.push_back(new Token("keyword", "var"));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("keyword", "let"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", "="));
  tokens.push_back(new Token("identifier", "param1"));
  tokens.push_back(new Token("symbol", "+"));
  tokens.push_back(new Token("identifier", "param2"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("keyword", "return"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("symbol", "}"));

  tokens.push_back(new Token("keyword", "method"));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "power"));
  tokens.push_back(new Token("symbol", "("));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "param1"));
  tokens.push_back(new Token("symbol", ","));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "param2"));
  tokens.push_back(new Token("symbol", ")"));
  tokens.push_back(new Token("symbol", "{"));
  tokens.push_back(new Token("keyword", "var"));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("keyword", "while"));
  tokens.push_back(new Token("symbol", "("));
  tokens.push_back(new Token("identifier", "param2"));
  tokens.push_back(new Token("symbol", ">"));
  tokens.push_back(new Token("integerConstant", "0"));
  tokens.push_back(new Token("symbol", ")"));
  tokens.push_back(new Token("symbol", "{"));
  tokens.push_back(new Token("keyword", "let"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", "="));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", "*"));
  tokens.push_back(new Token("identifier", "param1"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("keyword", "let"));
  tokens.push_back(new Token("identifier", "param2"));
  tokens.push_back(new Token("symbol", "="));
  tokens.push_back(new Token("identifier", "param2"));
  tokens.push_back(new Token("symbol", "-"));
  tokens.push_back(new Token("integerConstant", "1"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("symbol", "}"));
  tokens.push_back(new Token("keyword", "return"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("symbol", "}"));

  tokens.push_back(new Token("keyword", "method"));
  tokens.push_back(new Token("keyword", "void"));
  tokens.push_back(new Token("identifier", "test"));
  tokens.push_back(new Token("symbol", "("));
  tokens.push_back(new Token("symbol", ")"));
  tokens.push_back(new Token("symbol", "{"));
  tokens.push_back(new Token("keyword", "var"));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("keyword", "let"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", "="));
  tokens.push_back(new Token("keyword", "skip"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("keyword", "do"));
  tokens.push_back(new Token("keyword", "skip"));
  tokens.push_back(new Token("symbol", ";"));
  tokens.push_back(new Token("keyword", "if"));
  tokens.push_back(new Token("symbol", "("));
  tokens.push_back(new Token("keyword", "skip"));
  tokens.push_back(new Token("symbol", ")"));
  tokens.push_back(new Token("symbol", "{"));
  tokens.push_back(new Token("symbol", "{"));
  tokens.push_back(new Token("symbol", "}"));
  tokens.push_back(new Token("keyword", "else"));
  tokens.push_back(new Token("symbol", "{"));
  tokens.push_back(new Token("symbol", "}"));
  tokens.push_back(new Token("symbol", "}"));

  tokens.push_back(new Token("symbol", "}"));

  try {
    CompilerParser parser(tokens);
    ParseTree* result = parser.compileProgram();
    if (result != NULL) {
      cout << result->tostring() << endl;
    }
  } catch (ParseException e) {
    cout << "Error Parsing!" << endl;
  }
}