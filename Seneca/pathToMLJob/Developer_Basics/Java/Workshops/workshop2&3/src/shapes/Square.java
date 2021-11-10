

package shapes;

// TODO: import side exception from "exceptions"
import exceptions.Side;
import exceptions.Sides;

public class Square implements Shape{

	private double L;


	@Override
	public double perimeter() {
		// TODO: square: 4 * l
		return 4 * this.getL();
	}

	// TODO: constructor
	public Square(double l) throws Side
	{
		super();

		if (l <= 0)
		{
			throw new Side();
		}
		else
		{
			this.L = l;
		}
	}

	// TODO: getter
	public double getL()
	{
		return L;
	}

	// TODO: setter
	public void setL(double l)
	{
		this.L = l;
	}

	// TODO: toString: Square {s=3.0} perimeter = 12.0000
	@Override
	public String toString()
	{
		//return "Square {s=" + this.getL() + "} perimeter = " + perimeter();
		return "Square {s=" + this.getL() + "} ";
	}



}
