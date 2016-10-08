#include <stdio.h>

int called() {
	int x = 5;
	return x;
}

int main() {
	int y = called();
	printf("y is : %d\n", y);
}
