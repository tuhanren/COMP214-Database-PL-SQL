public class Test implements java.io.Serializable {

	private String str;
	private int ivalue;


	public Test(String s, int i) {
		str = s;
		ivalue = i;
	}

	public String getString() {
		return str;
	}

	public int getInt() {
		return ivalue;
	}
}
