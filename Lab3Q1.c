#include <msp430.h> 


/**
 * Question 1 for lab 2.
 */

float b = 2.5;

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	int a = 1;
	a += 1;
	b -= 1;

	unsigned char c = 0x0005;
	unsigned char d = 0x0007;
	unsigned char e = c & d;
	unsigned char f = d | c;

	while(1);

	return 0;
}
