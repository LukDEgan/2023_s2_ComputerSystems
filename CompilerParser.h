#ifndef COMPILERPARSER_H
#define COMPILERPARSER_H

#include <exception>
#include <list>

#include "ParseTree.h"
#include "Token.h"

class CompilerParser {
 private:
  std::list<Token*> tokens;

 public:
  ParseTree* compileClass();
  ParseTree* compileClassVarDec();
  ParseTree* compileSubroutine();
  ParseTree* compileParameterList();
  ParseTree* compileSubroutineBody();
  ParseTree* compileVarDec();

  ParseTree* compileStatements();
  ParseTree* compileLet();
  ParseTree* compileIf();
  ParseTree* compileWhile();
  ParseTree* compileDo();
  ParseTree* compileReturn();

  ParseTree* compileExpression();
  ParseTree* compileTerm();
  ParseTree* compileExpressionList();

  void next();
  Token* current();
  bool have(std::string expectedType, std::string expectedValue);
  Token* mustBe(std::string expectedType, std::string expectedValue);
  CompilerParser(std::list<Token*> tokens);
  ParseTree* compileProgram();
};

class ParseException : public std::exception {
 public:
  const char* what();
};

#endif /*COMPILERPARSER_H*/