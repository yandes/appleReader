#include <stdio.h>

int (*functionPtr) (int, int);

int addInt(int n, int m) {
	return n+m;
}

int main() {
	functionPtr = &addInt;
	printf("%d\n", functionPtr(2,3));
	return 0;
}
