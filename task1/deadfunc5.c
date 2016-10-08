#include <stdio.h>


int calledByOtherFunction() {
	int j = 12;
	return j;
}

int called() {
	int i = calledByOtherFunction();
	return i;
}

int notCalled() {
	int k = 0;
	return k;
}

int main() {
	int m = called();
	printf("m is : %d\n", m);
	return 0;
}


