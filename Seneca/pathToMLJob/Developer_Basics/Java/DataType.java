import java.util.Scanner;

public class DataType {
    public static void main (String[] args){
       int studentAge = 15;
    //    double studentGPA = 3.45;
    //    char studentFirstInitial = 'A';
    //    boolean studentPass = true;
    String firstDish = "Mussels";
    String studentFirstName = "Anna";
   //  char studentFirstInitial = studentFirstName.charAt(0);

       System.out.println(studentAge);
       System.out.println(firstDish);
       System.out.println(studentFirstName + " likes " + firstDish);
       System.out.println("What dish do you like the best?");
       //use scanner to take user input Scanner data type 
       try (Scanner inputDish = new Scanner (System.in)){
         firstDish = inputDish.next();
         System.out.println("You like " + firstDish);
         // close the scanner
         // inputDish.close();
       }

    }
}
