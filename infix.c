#include "infix.h"

int operatorWeight(char op)
{
        int weight = 0;

        switch(op)
        {

        case '+':
        case '-':
        weight = 1;
	break;

	case '*':
        case '/':
        weight = 2;
        break;

	case '^':
        weight = 3;
	break;
        }
        return weight;
}

// evaluate expression stored as an array of string tokens
double evaluate_infix_expression(char ** args, int nargs) {
	char **postfix = malloc(sizeof(char*)*nargs);
	int postfix_length = 0;
	struct double_stack *myStack = double_stack_new(nargs);

	for(int i = 0; i < nargs; i++)
	{
		//checking if it's an operand
		if(((args[i][0] <= '9') && (args[i][0] >= '0')) || ((args[i][0] == '-') && (args[i][1] >= '0') && (args[i][1] <= '9')))
			{
			//add to the output postfix stack
			postfix[postfix_length]=args[i];
			postfix_length++;
			}
		//checking if it's an (
		else if(args[i][0] == '(' )
			{
			//pushed onto the stack
			double_stack_push(myStack, i );
			}
		//checks if it's an operator
		else if ((args[i][0] == '+') && (args[i][0] == '-') && (args[i][0] == '*')
			&& (args[i][0] == '/') && args[i][0] == '^' )
			{
			//while there is operator ontop with equal or higher precedence
			while(operatorWeight(args[i][0]) <= operatorWeight(args[myStack->top][0]) )
				{
				//pop stack
				double op = double_stack_pop(myStack);
				//append popped operator to output string
				postfix[postfix_length] = args[(int)op];
				postfix_length++;
				}
			//push operator to stack
	    		double_stack_push(myStack, i);
			}
		//cheching if it's a )
		else if(args[i][0] == ')' )
			{
			while(myStack->top != '(')
				{
				//pop stack
				double op = double_stack_pop(myStack);
                		//append popped operator to output string
                		postfix[postfix_length] = args[(int)op];
				}
	    		double_stack_pop(myStack);

			}


}
                        while(myStack->top != 0)
                                {
                                //pop stack
                                double op = double_stack_pop(myStack);
                                //append popped operator to output string
                                postfix[postfix_length] = args[(int)op];
                                postfix_length++;
                                }

			return	evaluate_postfix_expression(postfix, postfix_length);
}
