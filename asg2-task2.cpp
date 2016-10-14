#include <cstdio>
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include <unordered_set>
#include <vector>
using namespace llvm;
using namespace std;

int main(int argc, char **argv)
{
typedef std::unordered_set<std::string> setVariables;
setVariables Svar;

// Read the IR file.
LLVMContext &Context = getGlobalContext();
SMDiagnostic Err;
for(int i=1; i<argc; i++){
	Module *M = ParseIRFile(argv[i], Err, Context);
	if (M == NULL)
	{
		fprintf(stderr, "error: failed to load LLVM IR file \"%s\"", argv[1]);
		return EXIT_FAILURE;
	}
	char * ptrName="alloca";
	char * ptrName1="load";
	
	for (auto &F: *M){
		for (auto &BB: F){
		printf("-------------Function Name: %s-------------\n",F.getName().str().c_str());
			for (auto &I: BB){
	
				//printf("opcode: %u\n", I.getOpcode());
				//printf("opcodeName:%s\n",I.getOpcodeName());
				//printf("Can read: %d\n", I.mayReadFromMemory());
				/*-----------------------AllocaInst----------------*/
				if(AllocaInst *ai =dyn_cast<AllocaInst>(&I)){
					Type* type1= ai->getAllocatedType();
					if(type1->isPointerTy()){
						printf("-------------Pointer---------------\n");
						printf("-------------ptr: %lu-------------\n", reinterpret_cast<uintptr_t>(&I));										
						//printf("Ptr Add: %u\n",type1->getPointerAddressSpace());					
					}
					if(type1->isSingleValueType()){
					printf("-------------Variable---------------\n");
					printf("-------------variable: %lu-------------\n", reinterpret_cast<uintptr_t>(&I));																				
					}
				}
				/*-------------------Store Instr--------------------*/
				if(StoreInst *si =dyn_cast<StoreInst>(&I)){
					Value* vSi =si->getPointerOperand();
					printf("-------------Store inst Value: %s-------------\n",vSi->getName());
					printf("-------------Store value addrspace: %u-------------\n",si->getPointerAddressSpace());
					printf("-------------Store value alignment: %u-------------\n",si->getAlignment());
					Type* type2=vSi->getType();
					PointerType* ptrType2 = type2->getPointerTo();
					printf("-------------PointedTo: %u-------------\n",ptrType2->getAddressSpace());
					if((!type2->isPointerTy())&&(type2->isSingleValueType()))
						printf("-------Store: Variable-------\n");
				
				}
				/*-----------------Load Instr-----------------------*/
				if(LoadInst *li =dyn_cast<LoadInst>(&I)){
				



				}
		
				}
		printf("\n");		
		
	}
}
}
return 0;
}