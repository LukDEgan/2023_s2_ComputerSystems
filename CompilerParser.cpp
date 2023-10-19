#include "CompilerParser.h"

#include <iostream>

/**
 * Constructor for the CompilerParser
 * @param tokens A linked list of tokens to be parsed
 */
CompilerParser::CompilerParser(std::list<Token*> tokens) : tokens(tokens) {}

/**
 * Generates a parse tree for a single program
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileProgram() {
  ParseTree* programNode = new ParseTree("Program", "");

  while (have("keyword", "class")) {
    ParseTree* classNode = compileClass();
    programNode->addChild(classNode);
  }
  if (tokens.empty()) {
    return programNode;
  } else {
    throw ParseException();
  }
  return NULL;
}

/**
 * Generates a parse tree for a single class
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileClass() {
  ParseTree* classNode = new ParseTree("class", "");

  classNode->addChild((ParseTree*)mustBe("keyword", "class"));
  Token* className = mustBe("identifier", current()->getValue());

  classNode->addChild((ParseTree*)className);

  classNode->addChild((ParseTree*)mustBe("symbol", "{"));
  while (have("keyword", "static") || have("keyword", "field")) {
    ParseTree* classVarDecNode = compileClassVarDec();
    classNode->addChild(classVarDecNode);
  }
  while (have("keyword", "constructor") || have("keyword", "function") ||
         have("keyword", "method")) {
    ParseTree* subroutineNode = compileSubroutine();
    classNode->addChild(subroutineNode);
  }
  classNode->addChild((ParseTree*)mustBe("symbol", "}"));
  return classNode;
}

/**
 * Generates a parse tree for a static variable declaration or field declaration
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileClassVarDec() {
  ParseTree* classVarDec = new ParseTree("classVarDec", "");
  while (have("keyword", "field") || have("keyword", "static")) {
    if (have("keyword", "static")) {
      mustBe("keyword", "static");
      classVarDec->addChild(new ParseTree("keyword", "static"));

    } else {
      mustBe("keyword", "field");
      classVarDec->addChild(new ParseTree("keyword", "field"));
    }
    ParseTree* typeNode = compileType();
    classVarDec->addChild(typeNode);
    next();

    while (true) {
      ParseTree* varName = (ParseTree*)current();
      classVarDec->addChild(varName);
      next();
      if (have("symbol", ",")) {
        classVarDec->addChild((ParseTree*)mustBe("symbol", ","));
      } else {
        break;
      }
    }
  }
  classVarDec->addChild((ParseTree*)mustBe("symbol", ";"));

  return classVarDec;
}
ParseTree* CompilerParser::compileType() {
  // Parse variable type
  if (have("keyword", "int") || have("keyword", "char") ||
      have("keyword", "boolean") || have("keyword", "void")) {
    return new ParseTree("keyword", current()->getValue());
  } else {
    // Assume it's a className (you might need additional logic for this part)
    return new ParseTree("keyword", current()->getValue());
  }
}
/**
 * Generates a parse tree for a method, function, or constructor
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileSubroutine() {
  ParseTree* subRoutine = new ParseTree("subroutine", "");
  while (have("keyword", "constructor") || have("keyword", "function") ||
         have("keyword", "method")) {
    if (have("keyword", "constructor")) {
      mustBe("keyword", "constructor");
      subRoutine->addChild(new ParseTree("keyword", "constructor"));

    } else if (have("keyword", "function")) {
      mustBe("keyword", "function");
      subRoutine->addChild(new ParseTree("keyword", "function"));
    } else {
      mustBe("keyword", "method");
      subRoutine->addChild(new ParseTree("keyword", "method"));
    }
    subRoutine->addChild(compileType());
    next();

    subRoutine->addChild(
        (ParseTree*)mustBe("identifier", current()->getValue()));

    subRoutine->addChild((ParseTree*)mustBe("symbol", "("));
    if (!have("symbol", ")")) {
      ParseTree* paramList = compileParameterList();
      subRoutine->addChild(paramList);
    }
    subRoutine->addChild((ParseTree*)mustBe("symbol", ")"));
    subRoutine->addChild(compileSubroutineBody());
  }
  return subRoutine;
}

/**
 * Generates a parse tree for a subroutine's parameters
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileParameterList() {
  ParseTree* paramList = new ParseTree("parameterList", "");
  while (true) {
    paramList->addChild(compileType());
    next();
    paramList->addChild(
        (ParseTree*)mustBe("identifier", current()->getValue()));
    if (have("symbol", ",")) {
      paramList->addChild((ParseTree*)mustBe("symbol", ","));
    } else {
      break;
    }
  }
  return paramList;
}

/**
 * Generates a parse tree for a subroutine's body
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileSubroutineBody() {
  ParseTree* subRoutineBody = new ParseTree("subroutineBody", "");
  subRoutineBody->addChild((ParseTree*)mustBe("symbol", "{"));
  while (!have("symbol", "}")) {
    if (have("keyword", "var")) {
      subRoutineBody->addChild(compileVarDec());
    } else {
      break;
    }
  }
  subRoutineBody->addChild((ParseTree*)mustBe("symbol", "}"));
  return subRoutineBody;
}

/**
 * Generates a parse tree for a subroutine variable declaration
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileVarDec() {
  ParseTree* varDec = new ParseTree("varDec", "");
  varDec->addChild((ParseTree*)mustBe("keyword", "var"));
  ParseTree* varType = compileType();
  varDec->addChild(varType);
  next();
  while (true) {
    varDec->addChild((ParseTree*)mustBe("identifier", current()->getValue()));
    if (have("symbol", ",")) {
      varDec->addChild((ParseTree*)mustBe("symbol", ","));
    } else {
      break;
    }
  }
  varDec->addChild((ParseTree*)mustBe("symbol", ";"));

  return varDec;
}

/**
 * Generates a parse tree for a series of statements
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileStatements() { return NULL; }

/**
 * Generates a parse tree for a let statement
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileLet() { return NULL; }

/**
 * Generates a parse tree for an if statement
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileIf() { return NULL; }

/**
 * Generates a parse tree for a while statement
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileWhile() { return NULL; }

/**
 * Generates a parse tree for a do statement
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileDo() { return NULL; }

/**
 * Generates a parse tree for a return statement
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileReturn() { return NULL; }

/**
 * Generates a parse tree for an expression
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileExpression() { return NULL; }

/**
 * Generates a parse tree for an expression term
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileTerm() { return NULL; }

/**
 * Generates a parse tree for an expression list
 * @return a ParseTree
 */
ParseTree* CompilerParser::compileExpressionList() { return NULL; }

/**
 * Advance to the next token
 */
void CompilerParser::next() {
  if (!tokens.empty()) {
    tokens.pop_front();
  }
  return;
}

/**
 * Return the current token
 * @return the Token
 */
Token* CompilerParser::current() {
  if (!tokens.empty()) {
    return tokens.front();
  }
  return NULL;
}

/**
 * Check if the current token matches the expected type and value.
 * @return true if a match, false otherwise
 */
bool CompilerParser::have(std::string expectedType, std::string expectedValue) {
  if (!tokens.empty()) {
    Token* currentToken = current();
    if (currentToken->getValue() == expectedValue &&
        currentToken->getType() == expectedType) {
      return true;
    }
  }
  return false;
}

/**
 * Check if the current token matches the expected type and value.
 * If so, advance to the next token, returning the current token, otherwise
 * throw a ParseException.
 * @return the current token before advancing
 */
Token* CompilerParser::mustBe(std::string expectedType,
                              std::string expectedValue) {
  if (!tokens.empty()) {
    Token* currentToken = current();
    if (have(expectedType, expectedValue)) {
      next();
      return currentToken;
    } else {
      throw ParseException();
    }
  }
  return NULL;
}

/**
 * Definition of a ParseException
 * You can use this ParseException with `throw ParseException();`
 */
const char* ParseException::what() {
  return "An Exception occurred while parsing!";
}
