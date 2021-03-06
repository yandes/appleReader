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
#include <map>
using namespace llvm;
using namespace std;
using std::map;
using std::pair;
using std::make_pair;

int main(int argc, char **argv){

//typedef std::unordered_set<std::string> setVariables;
//setVariables Svar;

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

		
	for (auto &F: *M){
		for (auto &BB: F){
		printf("--Function Name: %s--\n",F.getName().str().c_str());
		// typedef pair<llvm::Value *,string> pair_alloca;
		//typedef pair<llvm::Value *,string> pair_load;
		// typedef pair<llvm::Value *,string> pair_gep;

		map<unsigned long, pair<llvm::Value *, string>> allocaMap;
		map<llvm::Value *, string>::iterator it1;
		map<unsigned long, pair<llvm::Value *, string>> elePtrMap;
		map<llvm::Value *, string> storeMap;
		map<unsigned long, pair<llvm::Value *, string>> loadMap;
		map<llvm::Value *, string> retMap;
		//map<unsigned long , string> leftMap;
			for (auto &I: BB){

			/*-----------------------AllocaInst----------------*/
			if(AllocaInst *ai =dyn_cast<AllocaInst>(&I)){
				/*printf("-----------------Alloca str: %s-----------------\n",ai->getName());
				printf("-----------------Alloca add:%u-------------\n", ai->getOperand(0));
				printf("-------------AllocaInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));*/
				string str = ai -> getName();	
				//allocaMap.insert(std::make_pair(ai->getOperand(0),str));
				//allocaMap.insert(std::make_pair(reinterpret_cast<uintptr_t>(&I),std::make_pair(ai->getOperand(0),str)));
				//allocaMap[reinterpret_cast<uintptr_t>(&I)]=pairs_inst(ai->getOperand(0),str);
				allocaMap.insert(std::make_pair(reinterpret_cast<uintptr_t>(&I),make_pair(ai->getOperand(0),str)));
				//leftMap.insert(std::make_pair(reinterpret_cast<uintptr_t>(&I),"A"));
				}
			/*-----------------------------------Store Instr------------------------------------*/
			if(StoreInst *si =dyn_cast<StoreInst>(&I)){
				Value* vSi =si->getPointerOperand();
				//printf("-----------------Store inst Value: %s-----------------\n",vSi->getName());
				/*printf("-----------------Store 1 str: %s-----------------\n",si->getName());
				printf("-----------------Store add:%u-------------\n", si);
				printf("-----------------Store 2 str: %s-----------------\n",si->getOperand(0)->getName());
				printf("-----------------Store add:%u-------------\n", si->getOperand(0));
				printf("-----------------Store 3 str: %s-----------------\n",si->getOperand(1)->getName());
				printf("-----------------Store add: %u-------------\n", si->getOperand(1));
				printf("-------------StoreInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));*/
				string str1 = si->getOperand(0)->getName();
				storeMap.insert(std::make_pair(si->getOperand(0),str1));
				string str2 = si->getOperand(1)->getName();
				storeMap.insert(std::make_pair(si->getOperand(1),str2));
				//leftMap.insert(std::make_pair(reinterpret_cast<uintptr_t>(&I),"S"));
				
				}
			/*---------------------------------Load Instr---------------------------------------*/
			if(LoadInst *li =dyn_cast<LoadInst>(&I)){
				/*printf("-----------------Load str: %s-----------------\n",li->getOperand(0)->getName());
				printf("-----------------Load add:%u-------------\n", li->getOperand(0));
				printf("-------------LoadInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));*/
				string str = li->getOperand(0)->getName();	
				//loadMap.insert(std::make_pair(li->getOperand(0),str));
				loadMap.insert(std::make_pair(reinterpret_cast<uintptr_t>(&I),make_pair(li->getOperand(0),str)));
				//loadMap[reinterpret_cast<uintptr_t>(&I)]=pairs_inst(li->getOperand(0),str);
				//leftMap.insert(std::make_pair(reinterpret_cast<uintptr_t>(&I),"L"));
				}
			/*--------------------------------Ret Instr--------------------------------*/
			if(I.getOpcode()==Instruction::Ret){
				ReturnInst *inst = dyn_cast<ReturnInst>(&I);
				/*printf("-----------------Ret str: %s-----------------\n",inst->getOperand(0)->getName());
				printf("-----------------Ret add:%u-------------\n", inst->getOperand(0));
				printf("-------------RetInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));	*/		
				string str = inst->getOperand(0)->getName();	
				retMap.insert(std::make_pair(inst->getOperand(0),str));
			
				}
			/*--------------------------------GEP--------------------------------*/	
			if(I.getOpcode()==Instruction::GetElementPtr){
				GetElementPtrInst *inst =dyn_cast<GetElementPtrInst>(&I);
				/*printf("-----------------getelementptr str: %s-----------------\n",inst->getName());
				printf("-----------------getelementptr add:%u-------------\n", inst);
				printf("-----------------getelementptr str: %s-----------------\n",inst->getOperand(0)->getName());
				printf("-----------------getelementptr add:%u-------------\n", inst->getOperand(0));
				printf("-------------getelementptrInstI: %lu-------------\n\n", reinterpret_cast<uintptr_t>(&I));*/			
				string str = inst->getOperand(0)->getName();	
				//elePtrMap.insert(std::make_pair(inst->getOperand(0),str));
				//elePtrMap[reinterpret_cast<uintptr_t>(&I)]=pairs_inst(inst->getOperand(0),str);
				elePtrMap.insert(std::make_pair(reinterpret_cast<uintptr_t>(&I),make_pair(inst->getOperand(0),str)));
				//leftMap.insert(std::make_pair(reinterpret_cast<uintptr_t>(&I),"E"));
				}
			
			}//End BB loop

			/*printf("\n");		
			printf("allocaMap Size: %lu\n", allocaMap.size());
			printf("elePtrMap Size: %lu\n", elePtrMap.size());
			printf("storeMap Size: %lu\n", storeMap.size());
			printf("loadMap Size: %lu\n", loadMap.size());
			printf("retMap Size: %lu\n", retMap.size());
			//printf("leftMap Size: %lu\n\n", leftMap.size());
			//if (elePtrMap.size() > 0){
				for (auto &ent1:retMap){
				printf("retMAP: %lu -- %s\n", ent1.first,ent1.second.c_str());}
				for (auto &ent2:allocaMap){
				printf("allocaMAP: inst:%lu -- addr:%u -- %s\n", ent2.first, ent2.second.first, ent2.second.second.c_str());}
				for (auto &ent3:storeMap){
				printf("storeMAP: %lu -- %s\n", ent3.first,ent3.second.c_str());}
				for (auto &ent4:loadMap){
				printf("loadMAP: inst:%lu -- addr:%u -- %s\n", ent4.first, ent4.second.first, ent4.second.second.c_str());}
				for (auto &ent5:elePtrMap){
				printf("elePtrMap: inst:%lu -- addr:%u -- %s\n", ent5.first, ent5.second.first, ent5.second.second.c_str());}*/
				//for (auto &ent6:leftMap){
				//printf("leftMap: %u -- %s\n", ent6.first,ent6.second.c_str());
				//}
			printf("\n");
			printf("--Find Escape--\n");
			for (auto &ent1:retMap){
			if(loadMap.count(reinterpret_cast<unsigned long>(ent1.first))==1){
				Value* luL=(loadMap.find(reinterpret_cast<unsigned long>(ent1.first))->second.first);
				if(storeMap.count(luL)==1){
					unsigned long luS = reinterpret_cast<unsigned long> (storeMap.find(luL)->first);
					if(elePtrMap.size()>0 && elePtrMap.count(luS)==1){
						luS = reinterpret_cast<unsigned long>(elePtrMap.find(luS)->second.first);
						//printf("elePtrMap:%lu\n",luS);
					}
					if(allocaMap.count(luS)==1){
						printf("--Address: %lu\n",allocaMap.find(luS)->second.first);
						printf("--Instruction add %lu\n",allocaMap.find(luS)->first);
						printf("--Name: %s\n",allocaMap.find(luS)->second.second.c_str());
					}
				}
			}
		}
		printf("\n");
				
				
		
					
	
		}//End Func Loop
	}//End Module Loop

	}


return 0;
}


			

	

			

	