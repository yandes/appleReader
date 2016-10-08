#include <stdio.h>

char *init_array(void) {
	char array[10];
	char *p = array;
	return p;
}

char *escape_local() {
	char local_char = 'a';
	char *p = &local_char;
	return p;
}

int main() {
	char *a = init_array();
	char *b = escape_local();
	printf("%s", a);
	printf("%s", b);
	return 0;
}	
