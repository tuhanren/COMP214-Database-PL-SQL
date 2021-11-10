// java GUI tutorial: https://www.guru99.com/java-swing-gui.html
// java GUI tutorial: https://www3.ntu.edu.sg/home/ehchua/programming/java/j4a_gui.html

package serializable;
import java.awt.*;
import java.awt.event.*;

import javax.swing.JFrame;

import java.io.*;
import javax.swing.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

//class ApplicationFrame {
//    public static void main(String args[]) {
//
//        //Creating the Frame
//        JFrame frame = new JFrame("Application Frame");
//        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//        frame.setSize(400, 400);
//
//        //Creating the MenuBar and adding components
//        JMenuBar mb = new JMenuBar();
//        JMenu m1 = new JMenu("FILE");
//        JMenu m2 = new JMenu("Help");
//        mb.add(m1);
//        mb.add(m2);
//        JMenuItem m11 = new JMenuItem("Open File");
//        JMenuItem m22 = new JMenuItem("Save");
//        m1.add(m11);
//        m1.add(m22);
//
//        //Creating the panel at bottom and adding components
//        JPanel panel = new JPanel(); // the panel is not visible in output
//        JLabel label = new JLabel("Enter Text");
//        JTextField tf = new JTextField(10); // accepts upto 10 characters
//        JButton send = new JButton("Send");
//        JButton reset = new JButton("Reset");
//        panel.add(label); // Components Added using Flow Layout
//        panel.add(tf);
//        panel.add(send);
//        panel.add(reset);
//
//        // Text Area at the Center
//        JTextArea ta = new JTextArea();
//
//        //Adding Components to the frame.
//        frame.getContentPane().add(BorderLayout.SOUTH, panel);
//        frame.getContentPane().add(BorderLayout.NORTH, mb);
//        frame.getContentPane().add(BorderLayout.CENTER, ta);
//        frame.setVisible(true);
//    }
//}
public class ApplicationFrame extends JFrame{
	//compare serial version UID
	private static final long serialVersionUID = 1L;
	final String stdFile = "studentInfo.dat";

	//an arraylist for student info serialization
	private ArrayList<Student> studentsArr = new ArrayList<Student>();
	//create a container to store
	private Container container;

	//label for student
	private final JLabel l_title;
	private final JLabel l_studentID;
	private final JLabel l_fName;
	private final JLabel l_lName;
	private final JLabel l_course;
	//text for student
	private final JTextField t_studentID;
	private final JTextField t_fName;
	private final JTextField t_lName;
	private final JTextArea t_courses;
	//button for serialize/deserialize/close
	private final JButton b_serialize;
	private final JButton b_deserialize;
	private final JButton b_close;
	//display saved info
	private final JTextArea stdInfo;

	private class ButtonHandler implements ActionListener {

		private boolean serialize()
		{
			boolean result = false;
			ObjectOutputStream oos;

			try {
					String id = t_studentID.getText().trim().toString();

					if( id.length() == 0)
					{
						JOptionPane.showMessageDialog(ApplicationFrame.this, "Invalid StudentID");

						return result;
					}

					oos = new ObjectOutputStream(new FileOutputStream(stdFile));

					int intID = Integer.parseInt(id);
					Student student = new Student(intID, t_fName.getText(), t_lName.getText());

					String[] stdCourses = t_courses.getText().split("\\r?\\n");

					ArrayList<String> coursesList = new ArrayList<>(Arrays.asList(stdCourses));

					student.setCourse(coursesList);

					//Add the student object to the array list
					studentsArr.add(student);

					oos.writeObject(studentsArr);
					JOptionPane.showMessageDialog(ApplicationFrame.this, "StudentID has been saved successfully!");
					result = true;

					oos.flush();
					oos.close();

			}
			catch (FileNotFoundException e)
			{
				JOptionPane.showMessageDialog(ApplicationFrame.this, "Writing file failed!" + e.getMessage());
				e.printStackTrace();
			}
			catch (IOException e)
			{
				JOptionPane.showMessageDialog(ApplicationFrame.this, "Accessing file failed!" + e.getMessage());
				e.printStackTrace();
			}

			return result;
		}

		private void deserialize()
		{
			StringBuffer buffer = new StringBuffer();

			try {
					ObjectInputStream ois = new ObjectInputStream(new FileInputStream(stdFile));

					//Create a List to import all the Student objects
					List<Student> studentList = null;

					studentList = (List<Student>) ois.readObject();

					buffer.append("Students Info\n");
					buffer.append("============\n");

					for (Student student: studentList)
					{
						//Append the object data using the following print format
						buffer.append("Student's ID: " + student.getID()+"\n");
						buffer.append("Student's First Name: " + student.getFName()+"\n");
						buffer.append("Student's Last Name: " + student.getLName()+"\n");
						buffer.append("Student's Courses: " + student.getCourse()+"\n");
						buffer.append("------------------------------------------\n");
					}
					if (ois != null)
					{
						ois.close();
					}
			}
			catch(Exception e)
			{
				JOptionPane.showMessageDialog(ApplicationFrame.this, "Reading file failed.\n" + e.getMessage());
				e.printStackTrace();
			}

			stdInfo.setText(buffer.toString());
		}

		@Override
		public void actionPerformed(ActionEvent event)
		{
			String sButtonName = String.format("%s", event.getActionCommand());
			switch (sButtonName)
			{
				case "Serialize":
					serialize();
					break;
				case "Deserialize":
					deserialize();
					break;
				case "Close":
					System.exit(1);
			}
		}
	}

	//constructor to set up gui components:
	public ApplicationFrame() {
		// application frame:
		super("STUDENT'S INFO");
		// set font:
		final String fontType = "Consolas";

		//set frame size and container layout
		setSize(800, 1000);
		container = getContentPane();
		container.setLayout(null);
		setVisible(true);
		//add title to container
		l_title = new JLabel("Student's Infomation");
		l_title.setFont(new Font(fontType, Font.PLAIN, 23));
		l_title.setForeground(Color.black);
		l_title.setSize(300,30);
		l_title.setLocation(430,0);
		container.add(l_title);
		//add studentID to container
		l_studentID = new JLabel("Enter student's ID");
		l_studentID.setFont(new Font(fontType, Font.PLAIN, 16));
		l_studentID.setSize(150, 30);
		l_studentID.setLocation(100, 100);
		container.add(l_studentID);
		//add student first name to container
		l_fName = new JLabel("Enter Last Name");
		l_fName.setFont(new Font(fontType, Font.PLAIN, 16));
		l_fName.setSize(200, 30);
		l_fName.setLocation(100, 200);
		container.add(l_fName);
		//add student last name to container
		l_lName = new JLabel("Enter First Name");
		l_lName.setFont(new Font(fontType, Font.PLAIN, 16));
		l_lName.setSize(200, 30);
		l_lName.setLocation(100, 150);
		container.add(l_lName);
		//add student course to container
		l_course = new JLabel("Enter Courses");
		l_course.setFont(new Font(fontType, Font.PLAIN, 16));
		l_course.setSize(200, 30);
		l_course.setLocation(100, 250);
		container.add(l_course);
		//add studentId text area to container
		t_studentID = new JTextField(10);
		t_studentID.setFont(new Font(fontType, Font.PLAIN, 16));
		t_studentID.setSize(150, 30);
		t_studentID.setLocation(250, 100);
		container.add(t_studentID);
		//add student's first name text area to container
		t_fName = new JTextField(50);
		t_fName.setFont(new Font(fontType, Font.PLAIN, 16));
		t_fName.setSize(300, 30);
		t_fName.setLocation(250, 150);
		container.add(t_fName);
		//add student's last name text area to container
		t_lName = new JTextField(50);
		t_lName.setFont(new Font(fontType, Font.PLAIN, 16));
		t_lName.setSize(300, 30);
		t_lName.setLocation(250, 200);
		container.add(t_lName);
		//add student's courses text area to container
		Box courseBox = Box.createHorizontalBox();
		t_courses = new JTextArea("", 100, 1);
		t_courses.setSize(300, 300);
		courseBox.add(new JScrollPane(t_courses));
		courseBox.setSize(300, 300);
		courseBox.setLocation(250,250);
		container.add(courseBox);

		//buttons
		b_serialize = new JButton("Submit");
		b_serialize.setFont(new Font(fontType, Font.PLAIN, 16));
		b_serialize.setSize(180, 50);
		b_serialize.setLocation(320, 600);
		container.add(b_serialize);

		b_close = new JButton("Close Window");
		b_close.setFont(new Font(fontType, Font.PLAIN, 16));
		b_close.setSize(180, 50);
		b_close.setLocation(490, 680);
		container.add(b_close);

		b_deserialize = new JButton("Display");
		b_deserialize.setFont(new Font(fontType, Font.PLAIN, 16));
		b_deserialize.setSize(180, 50);
		b_deserialize.setLocation(660, 600);
		container.add(b_deserialize);

		//add student's information to container
		Box stdInfoBox = Box.createHorizontalBox();
		stdInfo = new JTextArea("(Nothing displayed yet)", 10, 2);
		stdInfo.setSize(300, 450);
		stdInfo.setEditable(false);
		stdInfoBox.add(new JScrollPane(stdInfo));
		stdInfoBox.setSize(300, 450);
		stdInfoBox.setLocation(600,100);
		container.add(stdInfoBox);

		//handle button event
		ButtonHandler hdlSerialize = new ButtonHandler();
		b_serialize.addActionListener(hdlSerialize);
		ButtonHandler hdlDeserialize = new ButtonHandler();
		b_deserialize.addActionListener(hdlDeserialize);
		ButtonHandler hdlClose = new ButtonHandler();
		b_close.addActionListener(hdlClose);
	}

	public static void main(String[] args)
	{
		ApplicationFrame frame = new ApplicationFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}
}
