

package shapes;

// TODO: import radius exception from "exceptions" package
import exceptions.Radius;

public class Circle implements Shape{

	private double radius;

	@Override
	public double perimeter()
	{
		// TODO: perimeter: 2*pi*r

		return 2 * Math.PI * getRadius();
	};

	// TODO: constructor
	public Circle(double r) throws Radius
	{
		super();

		if (r > 0)
		{
			radius = r;
		}
		else
		{
			throw new Radius();
		}
	}

	// TODO: Getter
	public double getRadius()
	{
		return radius;
	}

	// TODO: Setter
	public void setRadius(double r)
	{
		this.radius = r;
	}

	// TODO: toString: Circle {r=1.0} perimeter = 6.28319
	@Override
	public String toString()
	{
		//return "Circle {r=" + this.getRadius() + "} perimeter = " + perimeter();
		return "Circle {r=" + this.getRadius() + "} ";
	}


}
