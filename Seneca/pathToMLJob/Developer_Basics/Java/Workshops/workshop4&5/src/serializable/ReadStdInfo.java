
package serializable;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;

public class ReadStdInfo {
	//TODO: 2. then show their info in the console
	public static StringBuffer displayStd(Student student)
	{
		StringBuffer buff = new StringBuffer();

		buff.append("Student's ID: " + student.getID()+ "\n");
		buff.append("Student's First Name: " + student.getFName() + "\n");
		buff.append("Student's Last Name: " + student.getLName() + "\n");
		buff.append("Student's Courses: " + student.getCourse() + "\n");

		return buff;
	}

	//TODO: 1. read those student objects from the file
	public static void main(String[] args) throws ClassNotFoundException {
		System.out.println("*************< Student's Information >*************\n");
		try {
				ObjectInputStream objStream = new ObjectInputStream(new FileInputStream("studentInfo.dat"));
				Student student = (Student) objStream.readObject();

				while(student != null)
				{
					System.out.println(displayStd(student));
					student = (Student) objStream.readObject();
				}
				// close the input stream
				objStream.close();
			}
		catch (FileNotFoundException e)
		{
			System.out.println(e.getMessage());
		}
		catch (ClassNotFoundException e)
		{
			System.out.println(e.getMessage());
		}
		catch (IOException e)
		{
			System.out.println(e.getMessage());
		}

	}

}
