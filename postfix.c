#include "postfix.h"
#include <math.h>

// evaluate expression stored as an array of string tokens
double evaluate_postfix_expression(char ** args, int nargs) {
    struct double_stack *myStack =  double_stack_new(nargs);
for(int i=0; i<nargs; i++){
printf(args[i]);
}
for(int i=0; i<nargs; i++)
	{

	//if opperand
	 if((args[i][0] <= '9' && args[i][0] >= '0') || (args[i][1] <= '9' && args[i][1] >= '0'))
		{
		//operand = true
		double operand = atof(args[i]);
		double_stack_push(myStack, operand);
		}
	else
		{

		switch(args[i][0] )
			{
			double opt1;
			double opt2;

			case '+':
			double_stack_push(myStack, double_stack_pop(myStack) + double_stack_pop(myStack));
			break;

			case '-':
			opt1 = double_stack_pop(myStack);
			opt2 = double_stack_pop(myStack);
			double_stack_push(myStack, opt2-opt1);
			break;

			case 'X':
			case '*':
			case 'x':
			double_stack_push(myStack, double_stack_pop(myStack) * double_stack_pop(myStack));
			break;

			case '/':
			opt1 = double_stack_pop(myStack);
			opt2 = double_stack_pop(myStack);
			double_stack_push(myStack, opt2/opt1);
			break;

			case '^':
			opt1 = double_stack_pop(myStack);
			opt2 = double_stack_pop(myStack);
			double_stack_push(myStack, pow(opt2, opt1));
			break;
			}

		}



	}
	double a = double_stack_pop(myStack);
	printf("%lf \n", a);
	return a;

}
