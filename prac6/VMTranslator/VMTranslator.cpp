#include "VMTranslator.h"

#include <string>

using namespace std;
int VMTranslator::label_counter = 0;
/**
 * VMTranslator constructor
 */
VMTranslator::VMTranslator() {}

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
    result += "@" + indexStr + " //push" + segment + " " + indexStr + "\n";
    result += "D=A\n";
  } else if (segment == "static" || segment == "temp" || segment == "pointer") {
    result += "@" + segmentStr + " //push" + segment + " " + indexStr + "\n";
    result += "D=A\n";
    result += "@" + indexStr + "\n";
    result += "A=D+A\n";
    result += "D=M\n";
  } else if (segment == "argument" || segment == "this" || segment == "that" ||
             segment == "local") {
    result += "@" + segmentStr + " //push" + segment + " " + indexStr + "\n";
    result += "D=M\n";
    result += "@" + indexStr + "\n";
    result += "A=D+A\n";
    result += "D=M\n";
  }
  result += "@SP\n";
  result += "A=M\n";
  result += "M=D\n";
  result += "@SP\n";
  result += "M=M+1";
  return result;
}

/** Generate Hack Assembly code for a VM pop operation */
string VMTranslator::vm_pop(string segment, int offset) {
  string indexStr = to_string(offset);
  string segmentStr = SegmentTranslator(segment, offset);
  string result;
  if (segment == "constant") {
    result += "cannot pop to constant";
    return result;
  } else if (segment == "temp" || segment == "pointer" || segment == "static") {
    result += "@" + segmentStr + " //pop" + segment + " " + indexStr + "\n";
    result += "D=A\n";
  } else if (segment == "argument" || segment == "local" || segment == "this" ||
             segment == "that") {
    result += "@" + segmentStr + " //pop" + segment + " " + indexStr + "\n";
    result += "D=M\n";
  }
  result += "@" + indexStr + "\n";
  result += "D=D+A\n@R13\nM=D\n@SP\nAM=M-1\nD=M\n@R13\nA=M\nM=D";
  return result;
}

/** Generate Hack Assembly code for a VM add operation */
string VMTranslator::vm_add() {
  string result;
  result += "@SP //add\n";
  result += "AM=M-1\n";
  result += "D=M\n";
  result += "A=A-1\n";
  result += "M=D+M\n";
  return result;
}

/** Generate Hack Assembly code for a VM sub operation */
string VMTranslator::vm_sub() {
  string result;
  result += "@SP //sub\n";
  result += "AM=M-1\n";
  result += "D=M\n";
  result += "A=A-1\n";
  result += "M=M-D\n";
  return result;
}

/** Generate Hack Assembly code for a VM neg operation */
string VMTranslator::vm_neg() {
  string result;
  result += "@SP //neg\n";
  result += "A=M-1\n";
  result += "M=-M\n";
  return result;
}

/** Generate Hack Assembly code for a VM eq operation */
string VMTranslator::vm_eq() {
  label_counter++;
  string truelabel = "EQ_TRUE_" + to_string(label_counter);
  label_counter++;
  string falselabel = "EQ_FALSE_" + to_string(label_counter);
  string result;
  result += "@SP //eq\n";
  result += "AM=M-1\n";
  result += "D=M\n";
  result += "A=A-1\n";
  result += "D=M-D\n";
  result += "@" + truelabel + "\n";
  result += "D;JEQ\n";
  result += "D=0\n";
  result += "@" + falselabel + "\n";
  result += "0;JMP\n";
  result += "(" + truelabel + ")\n";
  result += "D=-1\n";
  result += "(" + falselabel + ")\n";
  result += "@SP\n";
  result += "A=M-1\n";
  result += "M=D\n";
  return result;
}

/** Generate Hack Assembly code for a VM gt operation */
string VMTranslator::vm_gt() {
  label_counter++;
  string truelabel = "GT_TRUE_" + to_string(label_counter);
  label_counter++;
  string falselabel = "GT_FALSE_" + to_string(label_counter);
  string result;
  result += "@SP //gt\n";
  result += "AM=M-1\n";
  result += "D=M\n";
  result += "A=A-1\n";
  result += "D=M-D\n";
  result += "@" + truelabel + "\n";
  result += "D;JGT\n";
  result += "D=0\n";
  result += "@" + falselabel + "\n";
  result += "0;JMP\n";
  result += "(" + truelabel + ")\n";
  result += "D=-1\n";
  result += "(" + falselabel + ")\n";
  result += "@SP\n";
  result += "A=M-1\n";
  result += "M=D\n";
  return result;
}

/** Generate Hack Assembly code for a VM lt operation */
string VMTranslator::vm_lt() {
  label_counter++;
  string truelabel = "LT_TRUE_" + to_string(label_counter);
  label_counter++;
  string falselabel = "LT_FALSE_" + to_string(label_counter);
  string result;
  result += "@SP //lt\n";
  result += "AM=M-1\n";
  result += "D=M\n";
  result += "A=A-1\n";
  result += "D=M-D\n";
  result += "@" + truelabel + "\n";
  result += "D;JLT\n";
  result += "D=0\n";
  result += "@" + falselabel + "\n";
  result += "0;JMP\n";
  result += "(" + truelabel + ")\n";
  result += "D=-1\n";
  result += "(" + falselabel + ")\n";
  result += "@SP\n";
  result += "A=M-1\n";
  result += "M=D\n";
  return result;
}

/** Generate Hack Assembly code for a VM and operation */
string VMTranslator::vm_and() {
  string result;
  result += "@SP //and\n";
  result += "AM=M-1\n";
  result += "D=M\n";
  result += "A=A-1\n";
  result += "M=M&D\n";
  return result;
}

/** Generate Hack Assembly code for a VM or operation */
string VMTranslator::vm_or() {
  string result;
  result += "@SP //or\n";
  result += "AM=M-1\n";
  result += "D=M\n";
  result += "A=A-1\n";
  result += "M=M|D\n";
  return result;
}

/** Generate Hack Assembly code for a VM not operation */
string VMTranslator::vm_not() {
  string result;
  result += "@SP //not\n";
  result += "A=M-1\n";
  result += "M=!M\n";
  return result;
}

/** Generate Hack Assembly code for a VM label operation */
string VMTranslator::vm_label(string label) {
  string result;
  result += "(" + label + ") // label " + label + "\n";
  return result;
}

/** Generate Hack Assembly code for a VM goto operation */
string VMTranslator::vm_goto(string label) {
  string result;
  result += "@" + label + " // goto " + label + "\n";
  result += "0;JMP\n";
  return result;
}

/** Generate Hack Assembly code for a VM if-goto operation */
string VMTranslator::vm_if(string label) {
  string result;
  result += "@SP // if-goto " + label + "\n";
  result += "AM=M-1\n";
  result += "D=M\n";
  result += "@" + label + "\n";
  result += "D;JNE\n";
  return result;
}

/** Generate Hack Assembly code for a VM function operation */
string VMTranslator::vm_function(string function_name, int n_vars) {
  string result;
  result += "(" + function_name + ") // function " + function_name +
            to_string(n_vars) + "\n";
  for (int i = n_vars; i > 0; i--) {
    result += "@SP\n";
    result += "AM=M+1\n";
    result += "A=A-1\n";
    result += "M=0\n";
  }
  return result;
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
  if (segment == "temp") return "5";
  if (segment == "pointer") return "3";
  return "constant or error";
}