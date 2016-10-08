#include <stdio.h>

int neverCalled() {
	int x = 5;
	return x;
}

int main () {
	int y = 0;
	printf("y is : %d\n", y);
}
