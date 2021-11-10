
package serializable;
import java.io.Serializable;
import java.util.ArrayList;

public class Student implements Serializable {
	private static final long serialVersionUID = 1L;
	//TODO: stdID (int), firstName (String), lastName (String), and courses
	private int m_stdID;
	private String m_fName;
	private String m_lName;
	private ArrayList<String> m_course;

	//TODO: constructors
	public Student(int stdID, String fName, String lName)
	{
		super();
		this.m_stdID = stdID;
		this.m_fName = fName;
		this.m_lName = lName;
		this.m_course = new ArrayList<String> ();
	}

	//TODO: add courses to list
	public void addCourse(String course)
	{
		this.m_course.add(course);
	}

	//TODO: getters
	public int getID()
	{
		return m_stdID;
	}

	public String getFName()
	{
		return m_fName;
	}

	public String getLName()
	{
		return m_lName;
	}
	public ArrayList<String> getCourse()
	{
		return m_course;
	}

	//TODO: setters
	public void setID(int id)
	{
		this.m_stdID = id;
	}

	public void setFName(String fName)
	{
		this.m_fName = fName;
	}
	public void setLName(String lName)
	{
		this.m_lName = lName;
	}
	public void setCourse(ArrayList<String> course)
	{
		this.m_course = course;
	}

}
