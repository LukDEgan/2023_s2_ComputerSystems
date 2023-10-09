#include "VMTranslator.h"

#include <string>

using namespace std;

/**
 * VMTranslator constructor
 */
VMTranslator::VMTranslator() {
  // Your code here
}

/**
 * VMTranslator destructor
 */
VMTranslator::~VMTranslator() {
  // Your code here
}

/** Generate Hack Assembly code for a VM push operation */
string VMTranslator::vm_push(string segment, int offset) {
  string indexStr = to_string(offset);
  string segmentStr = SegmentTranslator(segment, offset);
  string result;
  if (segment == "constant") {
    result += "@" + indexStr + "\n";
    result += "D=A\n";
  }
  if (segment == "static" || segment == "temp" || segment == "pointer") {
    result += "@" + segmentStr + "\n";
    result += "D=A\n";
    result += "@" + indexStr + "\n";
    result += "A=D+A\n";
    result += "D=M\n";
  }
  if (segment == "arguement" || segment == "this" || segment == "that" ||
      segment == "local") {
    result += "@" + segmentStr + "\n";
    result += "D=M\n";
    result += "@" + indexStr + "\n";
    result += "A=D+A\n";
    result += "D=M\n";
  }
  result += "@SP\n";
  result += "A=M\n";
  result += "M=D\n";
  result += "@SP\n";
  result += "@M=M+1\n";
  return result;
}

/** Generate Hack Assembly code for a VM pop operation */
string VMTranslator::vm_pop(string segment, int offset) {
  string indexStr = to_string(offset);
  string segmentStr = SegmentTranslator(segment, offset);
  string result;
  if (segment == "constant") {
    result += "cannot pop to constant";
  }
  if (segment == "static") {
    result += "@" + segmentStr + "\n";
    result += "D=A\n";
  }
  if (segment == "arguement" || segment == "local" || segment == "this" ||
      segment == "that" || segment == "temp" || segment == "pointer") {
    result += "@" + segmentStr + "\n";
    result += "D=M\n";
  }
  result += "@" + indexStr + "\n";
  result += "D=D+A\n@R13\nM=D\n@SP\nAM=M-1\nD=M\n@R13\nA=M\nM=D\n";
  return result;
}

/** Generate Hack Assembly code for a VM add operation */
string VMTranslator::vm_add() { return ""; }

/** Generate Hack Assembly code for a VM sub operation */
string VMTranslator::vm_sub() { return ""; }

/** Generate Hack Assembly code for a VM neg operation */
string VMTranslator::vm_neg() { return ""; }

/** Generate Hack Assembly code for a VM eq operation */
string VMTranslator::vm_eq() { return ""; }

/** Generate Hack Assembly code for a VM gt operation */
string VMTranslator::vm_gt() { return ""; }

/** Generate Hack Assembly code for a VM lt operation */
string VMTranslator::vm_lt() { return ""; }

/** Generate Hack Assembly code for a VM and operation */
string VMTranslator::vm_and() { return ""; }

/** Generate Hack Assembly code for a VM or operation */
string VMTranslator::vm_or() { return ""; }

/** Generate Hack Assembly code for a VM not operation */
string VMTranslator::vm_not() { return ""; }

/** Generate Hack Assembly code for a VM label operation */
string VMTranslator::vm_label(string label) { return ""; }

/** Generate Hack Assembly code for a VM goto operation */
string VMTranslator::vm_goto(string label) { return ""; }

/** Generate Hack Assembly code for a VM if-goto operation */
string VMTranslator::vm_if(string label) { return ""; }

/** Generate Hack Assembly code for a VM function operation */
string VMTranslator::vm_function(string function_name, int n_vars) {
  return "";
}

/** Generate Hack Assembly code for a VM call operation */
string VMTranslator::vm_call(string function_name, int n_args) { return ""; }

/** Generate Hack Assembly code for a VM return operation */
string VMTranslator::vm_return() { return ""; }

string VMTranslator::SegmentTranslator(string segment, int offset) {
  if (segment == "static") return "16";
  if (segment == "local") return "LCL";
  if (segment == "argument") return "ARG";
  if (segment == "this") return "THIS";
  if (segment == "that") return "THAT";
  if (segment == "temp") return "R" + to_string(offset + 5);
  if (segment == "pointer") return "R" + to_string(offset + 3);
  return "error";
}