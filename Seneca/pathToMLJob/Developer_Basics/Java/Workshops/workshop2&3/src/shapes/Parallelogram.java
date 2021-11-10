

package shapes;

// TODO: import sides exception from "exceptions"
import exceptions.Sides;
import exceptions.Side;

public class Parallelogram implements Shape{
	public double L;
	public double W;

	@Override
	public double perimeter() {
		// TODO: parallelogram: 2*l + 2*w
		return 2*(this.getL() + this.getW());
	}

	// TODO: constructor
	public Parallelogram(double l, double w) throws Sides
	{
		super();

		if (l <= 0 || w <= 0)
		{
			throw new Sides();
		}
		else
		{
			this.L = l;
			this.W = w;
		}
	}

	// TODO: getters
	public double getL()
	{
		return L;
	}
	public double getW()
	{
		return W;
	}

	// TODO: setters
	public void setL(double l)
	{
		this.L = l;
	}
	public void setW(double w)
	{
		this.W = w;
	}

	// TODO: toString: Parallelogram {w=4.0, h=9.0} perimeter = 26.0000
	public String toString()
	{
		//return "Parallelogram {w=" + this.getW() + ", h=" + this.getL() + "} perimeter = " + perimeter();
		return "Parallelogram {w=" + this.getW() + ", h=" + this.getL() + "} ";
	}

}
