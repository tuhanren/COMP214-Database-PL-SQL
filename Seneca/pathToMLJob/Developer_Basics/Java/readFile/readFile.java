// package readFile;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;

public class readFile {
    // filename
    static String FName = "shapes.txt";
    // read file line by line
    public static void valid(String[] str){

    }
    // public static void resultPrinter(Shape[] shapes){

    // }

    public static void t1(){
        String line;
        try (BufferedReader br = new BufferedReader(new FileReader(FName))) 
		{
            
			while ((line = br.readLine()) != null) 
			{
				String[] tokens = line.split(",");
				// check if the received token is valid
                
                
                System.out.println(tokens[0]);

            }
        } 
        catch (IOException e){
            System.out.println(e.getMessage());
           // System.err.format("IOException: %s%n", e);
        }
    }

    public static void main(String[] args) throws IOException
    {
        readFile.t1();
    }
}
