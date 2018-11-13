//Calculates the nth fibonacci number, utilizing the attached fib.s assembly code.
//Author: Nate Norris (github.com/nwnorris)
//Date: 11/12/18

#include <stdio.h>

int fib(int); //Extern assembly function

int main(){
	//Read in user input
	int n;
	printf("fib(?): ");
	scanf("%d", &n);

	//Make sure our English is correct! 1st/2nd/3rd/etc...
	char * extension = "th";
	if(n%10 == 1){
		extension = "st";
	} else if(n%10 == 2){
		extension = "nd";
	} else if(n%10 == 3){
		extension = "rd";
	}

	//Calculate and return the fib number
	printf("\nThe %d%s Fib number is %d.\n", n, extension, fib(n));
}