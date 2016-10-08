#include <stdio.h>

int called(int x, int y) {
	return (x + y);
}

int notCalled(int q, int w) {
	return (q - w);
}

int main() {
	if (called(2, 3)) {
		printf("Yay\n");
	}
	return 0;
}
