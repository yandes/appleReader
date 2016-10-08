#include <stdio.h>

int called(int a, int b) {
	int n = a + b;
	return n;
}

int notCalled(int x, int y) {
	int m = x - y;
	return m;
}

int main() {
	int j = 0;
	int l = 99;
	int h = called(j, l);
	printf("h is : %d\n", h);
	return 0;
}
