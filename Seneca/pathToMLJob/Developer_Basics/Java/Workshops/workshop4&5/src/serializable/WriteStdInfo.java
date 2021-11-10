
package serializable;

import java.io.*;


public class WriteStdInfo {
	public static Student saveStdInfo(String stdID, String fName, String lName, String[] course) throws IOException, FileNotFoundException
	{
		int id = Integer.parseInt(stdID);
		Student stdObj = null;

		// check if std id exists
		if(id > 0)
		{
			stdObj = new Student(id, fName, lName);

			// make sure courses are with the student
			for (String m_course : course)
			{
				stdObj.addCourse(m_course);
			}
			System.out.println("This is a valid ID");
		}
		else
		{
			System.out.println("Student ID is invalid");
		}
		return stdObj;
	}

	public static void main(String[] args) throws IOException{
		System.out.println("*************< Enter Student's Information >*************\n");

/*		Scanner myObj = new Scanner(System.in);  // Create a Scanner object
		System.out.println("Please enter Student's ID: ");
		int stdID = myObj.nextInt();  // Read user input

		System.out.println("Please enter Student's First Name: ");
		String fName = myObj.next();

		System.out.println("Please enter Student's Last Name: ");
		String lName = myObj.next();

		System.out.println("Please enter Student's courses: ");
		String course = myObj.next();
*/
		BufferedReader buffReader = null;
		ObjectOutputStream objStream = null;

		System.out.println("Please enter student's id, first name, last name and course (using comma to seperate): ");
		try {
				buffReader = new BufferedReader(new InputStreamReader(System.in));
				// output to studentInfo file
				objStream = new ObjectOutputStream(new FileOutputStream("studentInfo.dat"));
				String str = buffReader.readLine();
				String[] m_info = str.split(", ");

				while (!str.isEmpty())
				{


					String[] courses = new String[m_info.length - 3];
					int coursesIndex = 0;

					for(int i = 3; i < m_info.length; i++)
					{
						courses[coursesIndex++] = m_info[i];
					}

					//TODO: 3. verify that they had been saved (and serialized) correctly
					Student stdObj = saveStdInfo(m_info[0], m_info[1], m_info[2], courses);

					if(stdObj != null)
					{
						objStream.writeObject(stdObj);
						//flush the keyboard
						objStream.flush();
						System.out.println("Student has been saved successfully");
					}
					System.out.println("");
					str = buffReader.readLine();
				}
			} // catch all the exceptions
		catch (IOException e)
		{
			System.out.println(e.getMessage());
		}
//		catch (FileNotFoundException e)
//		{
//			System.out.println(e.getMessage());
//		}
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			//PrintStream buffReader = null;
			buffReader.close();
			//PrintStream objStream = null;
			objStream.close();
			System.out.println("Student has been written into the file successfully.");
		}


	}

}
