#include <stdio.h>

int notCalled() {
	int z = 6;
	return z;
}

int called() {
	int x = 4;
	return x;
}

int main() {
	int y = called();
	printf("y is : %d\n", y);
}
