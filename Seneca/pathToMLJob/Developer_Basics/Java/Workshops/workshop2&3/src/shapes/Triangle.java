

package shapes;

// TODO: import sides exception from "exceptions"
import exceptions.Sides;
import exceptions.Side;

public class Triangle implements Shape{
	// TODO: create a, b, c side for triangle
	private double A;
	private double B;
	private double C;


	@Override
	public double perimeter() {
		// TODO triangle Perimeter: a+b+c
		return this.getA() + this.getB() + this.getC();
	}

	// TODO: Constructor
	public Triangle(double a, double b, double c) throws Sides
	{
		super();
		// triangle sides rule: a+b>c; b+c>a; a+c>b; (a,b,c)>0
		if (((a + b) > c) && ((b + c) > a) && ((a + c) > b) && (a > 0) && (b > 0) && (c > 0))
		{
			this.A = a;
			this.B = b;
			this.C = c;
		}
		else
		{
			throw new Sides();
		}
	}

	// TODO: getters
	public double getA()
	{
		return A;
	}

	public double getB()
	{
		return B;
	}

	public double getC()
	{
		return C;
	}

	// TODO: setters
	public void setA(double a)
	{
		this.A = a;
	}

	public void setB(double b)
	{
		this.B = b;
	}

	public void setC(double c)
	{
		this.C = c;
	}

	// TODO: toString: Triangle {s1=3.0, s2=4.0, s3=5.0} perimeter = 12.0000
	@Override
	public String toString()
	{
		//return "Triangle {s1=" + this.getA() + ", s2=" + this.getB() + ", s3=" + this.getC() + "} perimeter = " + perimeter();
		return "Triangle {s1=" + this.getA() + ", s2=" + this.getB() + ", s3=" + this.getC() + "} ";
	}

}
