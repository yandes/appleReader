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
		printf("------------------------------------------Function Name: %s----------------------------------------\n",F.getName().str().c_str());
			for (auto &I: BB){

				/*-----------------------AllocaInst----------------*/
				if(AllocaInst *ai =dyn_cast<AllocaInst>(&I)){
					printf("-----------------Alloca str: %s-----------------\n",ai->getName());
					printf("-----------------Alloca add:%u-------------\n", ai);
					printf("-------------AllocaInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));								
					/*Type* type1= ai->getAllocatedType();
					if(type1->isPointerTy()){
						//printf("-----------------Pointer-------------------\n");
						printf("-------------Allocptr: %lu-------------\n", reinterpret_cast<uintptr_t>(&I));
						printf("-------------AllocptrInst: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&ai));										
						//printf("Ptr Add: %u\n",type1->getPointerAddressSpace());					
					}
					if(type1->isSingleValueType()){
					printf("------------------AllocVariable-------------------\n");
					printf("-------------AllocVariableI: %lu-------------\n", reinterpret_cast<uintptr_t>(&I));	
					printf("-------------AllocVarAi: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&ai));																			
					}*/
				}
				/*-----------------------------------Store Instr------------------------------------*/
				if(StoreInst *si =dyn_cast<StoreInst>(&I)){
					Value* vSi =si->getPointerOperand();
					
					//printf("-----------------Store inst Value: %s-----------------\n",vSi->getName());
					printf("-----------------Store 1 str: %s-----------------\n",si->getName());
					printf("-----------------Store add:%u-------------\n", si);
					printf("-----------------Store 2 str: %s-----------------\n",si->getOperand(0)->getName());
					printf("-----------------Store add:%u-------------\n", si->getOperand(0));
					printf("-----------------Store 3 str: %s-----------------\n",si->getOperand(1)->getName());
					printf("-----------------Store add: %u-------------\n", si->getOperand(1));
					printf("-------------StoreInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));			
				
				
				}
				/*---------------------------------Load Instr---------------------------------------*/
				if(LoadInst *li =dyn_cast<LoadInst>(&I)){
				printf("-----------------Load str: %s-----------------\n",li->getOperand(0)->getName());
				printf("-----------------Load add:%u-------------\n", li->getOperand(0));
				printf("-------------LoadInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));
/*				Value* vLi =li->getPointerOperand();
				printf("-----------------Load inst Value: %s-----------------\n",vLi->getName());
				printf("-------------LoadInstI: %lu-------------\n", reinterpret_cast<uintptr_t>(&I));
				printf("-------------Load Inst: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&li));*/
				}
				/*--------------------------------Ret Instr--------------------------------*/
				if(I.getOpcode()==Instruction::Ret){
				ReturnInst *inst = dyn_cast<ReturnInst>(&I);
				printf("-----------------Ret str: %s-----------------\n",inst->getOperand(0)->getName());
				printf("-----------------Ret add:%u-------------\n", inst->getOperand(0));
				printf("-------------RetInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));			


				/*Value* vRi =inst->getReturnValue();
				printf("-----------------Ret inst Value: %s-----------------\n",vRi->getName());
				printf("-------------RetInstI: %lu-------------\n", reinterpret_cast<uintptr_t>(&I));			
				printf("-------------Ret Inst: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&inst));*/
				}
				if(I.getOpcode()==Instruction::GetElementPtr){
				GetElementPtrInst *inst =dyn_cast<GetElementPtrInst>(&I);
				printf("-----------------getelementptr str: %s-----------------\n",inst->getName());
				printf("-----------------getelementptr add:%u-------------\n", inst);
				printf("-----------------getelementptr str: %s-----------------\n",inst->getOperand(0)->getName());
				printf("-----------------getelementptr add:%u-------------\n", inst->getOperand(0));
				printf("-------------getelementptrInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));			

				}
		
				}
		printf("\n");		
		
	}
}
}
return 0;
}