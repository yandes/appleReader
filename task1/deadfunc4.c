#include <stdio.h>

int notCalled() {
	int z = 7;
	return z;
}

int called() {
	int x = 0;
	return x;
}

int main() {
	int y = 0;
	if (1) {
		y = called();
	} else if (0) {
		y = notCalled();
	}
	return 0;
}
