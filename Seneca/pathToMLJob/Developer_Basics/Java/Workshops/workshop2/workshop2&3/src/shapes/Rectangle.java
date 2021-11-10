
package shapes;

// TODO: import side and sides exception from "exceptions"
import exceptions.Side;
import exceptions.Sides;

public class Rectangle implements Shape{
	// set rectangle width and length
	private double W;
	private double L;

	@Override
	public double perimeter() {
		// TODO rectangle: 2*W + 2*L
		return 2 * this.getW() + 2 * this.getL();
	}

	// TODO: Constructor
	public Rectangle(double w, double l) throws Side, Sides
	{
		super();

		if (w <= 0 || l <= 0)
		{
			if (w != l)
			{
				throw new Sides();
			}
			else
			{
				throw new Side();
			}
		}
		else
		{
			this.W = w;
			this.L = l;
		}
	}

	// TODO: getters
	public double getW()
	{
		return W;
	}
	public double getL()
	{
		return L;
	}

	// TODO: setters
	public void setW(double w)
	{
		this.W = w;
	}
	public void setL(double l)
	{
		this.L = l;
	}

	// TODO: toString: Triangle {s1=3.0, s2=4.0, s3=5.0} perimeter = 12.0000
	@Override
	public String toString()
	{
		//return "Rectangle {w=" + this.getW() + ", h=" + this.getL() + "} perimeter = " + perimeter();
		return "Rectangle {w=" + this.getW() + ", h=" + this.getL() + "} ";
	}

}
