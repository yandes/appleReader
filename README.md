# appleReader
#clang++-3.4 -std=c++11 -o Test Test.cpp `llvm-config-3.4 --cxxflags` `llvm-config-3.4 --ldflags` `llvm-config-3.4 --libs` -lpthread -lncurses -ldl
#./Test antipattern1.ll