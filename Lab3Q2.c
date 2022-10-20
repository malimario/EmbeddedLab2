#include <msp430.h> 


/**
 * Question 2 for lab 2.
 */
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	int a = 0b1000110001011111;
	int b = 0b1100001000100110;

	int c = sum(a,b);

	while(1);
	return 0;
}

int sum(int num1, int num2)
{
    return num1 + num2;
}
