

// TODO: import all necessary packages
import shapes.*;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;


public class Main
{
	static String FName = "shapes.txt";
	static int counter = 0;
	static Shape[] shapes_1 = null;


	// TODO: check validation
	public static boolean valid(String[] str)
	{
		boolean bool = false;

		// switch different cases for different geometric shapes
		switch (str[0])
		{
			case "Circle":
			{
				if(str.length == 2)
				{
					double r = Double.valueOf(str[1]);

					if(r > 0)
					{
						bool = true;
					}
				}
				break;
			}

			case "Triangle":
			{
				if(str.length == 4)
				{
					double a = Double.valueOf(str[1]);
					double b = Double.valueOf(str[2]);
					double c = Double.valueOf(str[3]);

					//triangle side rules
					if((a + b > c && a + c > b && b + c > a) && a > 0 && b > 0 && c > 0)
					{
						bool = true;
					}
				}
				break;
			}

			case "Square":
			{
				if(str.length == 2)
				{
					double s1 = Double.valueOf(str[1]);
					if(s1 > 0)
					{
						bool = true;
					}
				}
				break;
			}

			case "Parallelogram":
			{
				if(str.length == 3)
				{
					double side1 = Double.valueOf(str[1]);
					double side2 = Double.valueOf(str[2]);
					if(side1 > 0 && side2 > 0)
					{
						 bool = true;
					}
				}
				break;
			}

			case "Rectangle":
			{
				if(str.length == 3)
				{
					double w = Double.valueOf(str[1]);
					double l = Double.valueOf(str[2]);

					if(w > 0 && l > 0)
					{
						bool = true;
					}
				}
				break;
			}

				default:
				break;
		}
		return bool;
	}

	// TODO: result printer to print out exact result
	public static void resultPrinter(Shape[] shapes)
	{
		for (int i = 0; i < shapes.length; i++)
		{
			System.out.print(shapes[i].toString());
			System.out.printf("perimeter = %g", shapes[i].perimeter());
			System.out.println();
		}
		System.out.println();
	}

	// TODO: switch cases
//	public static void switchCase()
//	{
//		int idx = 0;
//		String s;
//
//		try (BufferedReader br = new BufferedReader(new FileReader(FName)))
//		{
//			// read files line by line
//			while ((s = br.readLine()) != null)
//			{
//				String[] tokens = s.split(",");
//				// check if the received token is valid
//				if (valid(tokens))
//				{
//					counter++;
//				}
//
//				try {
//					// different shape cases
//					switch (tokens[0])
//					{
//						case "Circle":
//						{
//							if(tokens.length != 2)
//							{
//								continue;
//							}
//							Circle obj = new Circle(Double.valueOf(tokens[1]));
//							shapes_1[idx++] = obj;
//						}
//						break;
//
//						case "Triangle":
//						{
//							if(tokens.length != 4)
//							{
//								continue;
//							}
//							Triangle obj = new Triangle(Double.valueOf(tokens[1]), Double.valueOf(tokens[2]), Double.valueOf(tokens[3]));
//							shapes_1[idx++] = obj;
//						}
//						break;
//
//						case "Square":
//						{
//							if(tokens.length != 2)
//							{
//								continue;
//							}
//							Square obj = new Square(Double.valueOf(tokens[1]));
//							shapes_1[idx++] = obj;
//						}
//						break;
//
//						case "Parallelogram":
//						{
//							if(tokens.length != 3)
//							{
//								continue;
//							}
//
//							Parallelogram parallelogram = new Parallelogram(Double.valueOf(tokens[1]), Double.valueOf(tokens[2]));
//							shapes_1[idx++] = parallelogram;
//						}
//						break;
//
//						case "Rectangle":
//						{
//							if(tokens.length != 3)
//							{
//								continue;
//							}
//
//							Rectangle obj = new Rectangle(Double.valueOf(tokens[1]), Double.valueOf(tokens[2]));
//							shapes_1[idx++] = obj;
//						}
//						break;
//
//
//						default:
//
//					}
//					System.out.println(tokens[0]);
//				}
//				catch(Exception e)
//				{
//						System.out.println(e.getMessage());
//				}
//			}
//		}
//		catch (IOException e)
//		{
//			System.out.println(e.getMessage());
//		}
//
//	}

	// TODO: Task 1 for WS2
	private static void t1()
	{
		System.out.println("------->Task 1 ... <-------");
		String s;
		int idx = 0;

		try (BufferedReader br = new BufferedReader(new FileReader(FName)))
		{
			while ((s = br.readLine()) != null)
			{
				//read file line by line
				String[] tokens = s.split(",");

				if(valid(tokens))
				{
					counter++;
				}
			}
			shapes_1 = new Shape[counter];
			try(BufferedReader b = new BufferedReader(new FileReader(FName)))
			{
				while ((s = b.readLine()) != null)
				{
					String[] tokens = s.split(",");
					try
					{
						switch (tokens[0])
						{
							case "Circle":
							{
								if(tokens.length != 2)
								{
									continue;
								}
								Circle obj = new Circle(Double.valueOf(tokens[1]));
								shapes_1[idx++] = obj;
							}
							break;

							case "Triangle":
							{
								if(tokens.length != 4)
								{
									continue;
								}
								Triangle obj = new Triangle(Double.valueOf(tokens[1]), Double.valueOf(tokens[2]), Double.valueOf(tokens[3]));
								shapes_1[idx++] = obj;
							}
							break;

							case "Rectangle":
							{
								if(tokens.length != 3)
								{
									continue;
								}

								Rectangle obj = new Rectangle(Double.valueOf(tokens[1]), Double.valueOf(tokens[2]));
								shapes_1[idx++] = obj;
							}
							break;

							case "Square":
							{
								if(tokens.length != 2)
								{
									continue;
								}
								Square obj = new Square(Double.valueOf(tokens[1]));
								shapes_1[idx++] = obj;
							}
							break;

							case "Parallelogram":
							{
								if(tokens.length != 3)
								{
									continue;
								}
								Parallelogram parallelogram = new Parallelogram(Double.valueOf(tokens[1]), Double.valueOf(tokens[2]));
								shapes_1[idx++] = parallelogram;
							}
							break;

							default:
						}
					}
					catch(Exception e)
					{
						System.out.println(e.getMessage());
					}
				}

				System.out.println(String.format("%d shapes were created:", counter));
				resultPrinter(shapes_1);
			}
			catch (IOException e)
			{
				System.out.println(e.getMessage());
			}
		}
		catch (IOException e)
		{
			System.out.println(e.getMessage());
		}
	}

	static Shape[] shapes_2 = null;
	// TODO: Task 2 for WS2
	private static void t2()
	{
		System.out.println("------->Task 2 ... <-------");

		//triangle with the minimum perimeter
		double tSmallestP = Double.MAX_VALUE;
		//circle with the maximum perimeter
		double cLargestP = Double.MIN_VALUE;

		for(int i = 0; i < shapes_1.length; i++)
		{
			if(shapes_1[i] instanceof Triangle)
			{
				tSmallestP = Math.min(tSmallestP, shapes_1[i].perimeter());
			}
			else if(shapes_1[i] instanceof Circle)
			{
				cLargestP = Math.max(cLargestP, shapes_1[i].perimeter());
			}
		}
		for(int i  = 0; i < shapes_1.length; i++)
		{
			if(shapes_1[i] instanceof Triangle)
			{
				if(shapes_1[i].perimeter() == tSmallestP)
				{
					counter--;
				}
			}
			else if(shapes_1[i] instanceof Circle)
			{
				if(shapes_1[i].perimeter() == cLargestP)
				{
					counter--;
				}
			}
		}
		shapes_2 = new Shape[counter];
		int index = 0;
		for(int i  = 0; i < shapes_1.length; i++)
		{
			if(shapes_1[i] instanceof Triangle)
			{
				if(shapes_1[i].perimeter() == tSmallestP)
				{
					continue;
				}
			}
			else if(shapes_1[i] instanceof Circle)
			{
				if(shapes_1[i].perimeter() == cLargestP)
				{
					continue;
				}
			}
			shapes_2[index++] = shapes_1[i];
		}
		resultPrinter(shapes_2);
	}

	//TODO: get total perimeter for parallelogram and triangle
	public static double totalP(Shape[] shapes)
	{
		double totalParaP = 0.0;

		for(int i = 0; i < shapes.length; i++)
		{
        	if(shapes[i] instanceof Parallelogram)
        	{
        		totalParaP += shapes[i].perimeter();
        	}
        }
		return totalParaP;
	}

	public static double totalT(Shape[] shapes)
	{
		double totalTriP = 0.0;

		for(int i = 0; i < shapes.length; i++)
		{
        	if(shapes[i] instanceof Triangle)
        	{
        		totalTriP += shapes[i].perimeter();
        	}
        }
		return totalTriP;
	}

	// TODO: Task 3 for WS2
	private static void t3()
	{
		System.out.println("------->Task 3 ... <-------");
		System.out.println("Total perimeter of Parallelogram is: " + totalP(shapes_2));
		System.out.println("Total perimeter of Triangle is: " + totalT(shapes_2));

	}


	public static void main(String[] args) throws IOException
	{
			System.out.println("------->JAC 444 Assignment 1<-------");
			Main.t1();
			Main.t2();
			Main.t3();
	}

}
