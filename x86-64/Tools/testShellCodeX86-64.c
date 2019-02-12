#include<stdio.h>

int main(int argc, char* argv[])
{
	int* shell;
	shell = (int*)&shell +2;
	*shell = (int)argv[1];
}
