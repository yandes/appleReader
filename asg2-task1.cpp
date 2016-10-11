#include <cstdio>
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include <string>
#include <iostream>
#include <unordered_set>
using namespace llvm;
using namespace std;

int main(int argc, char **argv)
{
	typedef std::unordered_set<std::string> setCalled;
	typedef std::unordered_set<std::string> setFunction;
	typedef std::unordered_set<std::string> setVariables;
	setCalled Scalls;
	setFunction Sfunc;
	setVariables Svar;

	// Read the IR file.
	LLVMContext &Context = getGlobalContext();
	SMDiagnostic Err;
	Module *M = ParseIRFile(argv[1], Err, Context);
	if (M == NULL)
	{
		fprintf(stderr, "error: failed to load LLVM IR file \"%s\"", argv[1]);
		return EXIT_FAILURE;
	}

	for (auto curFref = M->getFunctionList().begin(), 
			endFref = M->getFunctionList().end(); 
			curFref != endFref; ++curFref) {
		string str = curFref->getName().str().c_str();
		Sfunc.insert(str);


		//printf("found function:%s\n",curFref->getName().str().c_str());
	}

	// Function Pointers are stored as global variables
	for (auto curVref = M->getGlobalList().begin(),
			endVref = M->getGlobalList().end();
			curVref != endVref; ++curVref) {
		string var = curVref->getName().str().c_str();
		Svar.insert(var);
		//printf("Variable: %s\n", var);
	}


	for (auto &F: *M){
		for (auto &BB: F){
			for (auto &I: BB){

				// S/O copied code that I have no idea how to use
				if (StoreInst *si = dyn_cast<StoreInst>(&I)) {
					Value* v = si->getPointerOperand();
					Type* ptrType = v->getType()->getPointerElementType();
					if (PointerType* pt = dyn_cast<PointerType>(ptrType)) {
						do {
							Type* pointedType = pt->getTypeAtIndex((unsigned int)0);
							if (pointedType->isFunctionTy()) {
								break;
							}
							ptrType = pointedType;
						} while ((pt = (dyn_cast<PointerType>(ptrType))));
					}
					printf("Type: %s\n", ptrType);
				}

				CallInst *Call = dyn_cast<CallInst>(&I);
				if (Call == NULL) {
					continue;
				}
				Function *G = Call->getCalledFunction();
				if (G == NULL) {
					continue;
				}
				string str = G->getName().str().c_str();
				Scalls.insert(str);
				//printf("Called: %s\n", G->getName().str().c_str());
				//I.dump();

			}		
		}
	}

	printf("Total Number of Calls: %d\n",Scalls.size());
	printf("Total Number of Functions: %d\n",Sfunc.size());

	int counter = 0;
	printf("List of Dead functions:\n");
	for(auto& elem: Sfunc){
		std::unordered_set<std::string>::const_iterator got = Scalls.find (elem);
		if ( got == Scalls.end() ){
			if (elem != "main"){
				std::cout <<elem <<endl;
				counter++; 
			}
		}
	}
	printf("Total Number of Dead functions: %d\n",counter);





	return 0;
}
