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
   *          method int myFunc (int param1, char param2) {
   *               var int a, b;
   *          }
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
  tokens.push_back(new Token("identifier", "myFunc"));
  tokens.push_back(new Token("symbol", "("));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "param1"));
  tokens.push_back(new Token("symbol", ","));
  tokens.push_back(new Token("keyword", "char"));
  tokens.push_back(new Token("identifier", "param2"));
  tokens.push_back(new Token("symbol", ")"));
  tokens.push_back(new Token("symbol", "{"));
  tokens.push_back(new Token("keyword", "var"));
  tokens.push_back(new Token("keyword", "int"));
  tokens.push_back(new Token("identifier", "a"));
  tokens.push_back(new Token("symbol", ","));
  tokens.push_back(new Token("identifier", "b"));
  tokens.push_back(new Token("symbol", ";"));
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