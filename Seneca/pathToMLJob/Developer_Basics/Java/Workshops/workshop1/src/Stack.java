

public class Stack {
	//TODO: define private variables for stack

	private int capacity, position;

	//backed by a char array (as its storage)
	private char[] stackArray;




	//TODO: stack constructor
	public Stack(int stackSize)
	{
		stackArray = new char[stackSize];
		this.capacity = stackSize;
		this.position = -1;
	}

//	private void ensureCapacity(int newSize)
//	{
//	    char newBiggerArray[];
//	    if (array.length < newSize)
//	    {
//	        newBiggerArray = new char[array.length * 2];
//	        System.arraycopy(array, 0, newBiggerArray, 0, size);
//	        array = newBiggerArray;
//	    }
//	}

	//TODO: push and pop characters, one at a time
	public void push(char item)
	{
//	    ensureCapacity(size + 1);
//	    array[size] = item;
//	    size++;

		// if not full
		if (this.position != this.capacity - 1)
		{
			this.stackArray[++this.position] = item;
		}
	}

	public char pop()
	{
//		if (size == 0)
//		{
//	        throw new EmptyStackException();
//	    }
//	    return charArray[--size];

		char temp = '\0';

		if(this.position == -1)
		{
			System.out.println("Cannot find any content in the Stack");
		}
		else
		{
			temp = this.stackArray[this.position--];
		}

		return temp;

	}

//	public boolean isEmpty()
//	{
//		return this.position == -1;
//	}

	public static String reverse(String args)
	{
		char[] arr = args.toCharArray();
		int size = arr.length;
		Stack stack = new Stack(size);

		for (int i = 0; i < size; ++i)
		{
			stack.push(arr[i]);
		}
		for (int i = 0; i < size; ++i)
		{
			arr[i] = stack.pop();
		}

		return String.valueOf(arr);
	}
}
