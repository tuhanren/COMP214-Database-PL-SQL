

/*
A Palindrome is a word, phrase, number,
or other sequences of characters which reads the same backward as forward,
such as “madam” or “racecar”.

Ways to check:
1. simultaneously start iterating the given string forward and backward, one character at a time.
   If the there is a match the loop continues; otherwise, the loop exits
2. Reversing the String
3. Using stack, queue and scanner library
*/

public class Palindrome {

    public static void main(String[] args)
    {
    	if (args.length > 0)
    	{
    		if (args[0].equals(Stack.reverse(args[0])))
    		{
    			System.out.println("The original arg is: "+ args[0]);
    			System.out.println("Reversed arg is: " + Stack.reverse(args[0]));
    			System.out.println("This is a Palindrome string");
    		}
    		else
    		{
    			System.out.println("The original arg is: "+ args[0]);
    			System.out.println("Reversed arg is: " + Stack.reverse(args[0]));
    			System.out.println("This is not a Palindrome string");
    		}
    	}
    	else
		{
			System.out.println("No Command Line Arguement Found");
		}

    }

}
