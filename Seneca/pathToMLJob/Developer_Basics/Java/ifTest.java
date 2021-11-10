import java.util.Scanner;
import java.io.IOException;
public class ifTest {
    
    // TODO: instance variable can not be referred from static context
    String testScope = "A class string variable";
    // instance 
    int testNumScope = 50000;
    public static void main (String [] args){
        
        // System.out.println(testScope);
        // System.out.println(testNumScope);

        // System.out.println("Pick a integer between 1 and 10");

        // try (Scanner scanner = new Scanner(System.in))
        
        // {
        //     int inputNum = scanner.nextInt();
        //     if (inputNum < 5){
        //         System.out.println("Less than 5.");
        //     } 
        //     else {
        //         System.out.println("Happy today");
        //     }
        // }

        // String food = "mussels";
        // System.out.println(food);
        // boolean flag = true;
        // if (flag == true){
        //     System.out.println(food);
        // }

        String question = "What's the height of Qiwen";
        String choice1 = "163 cm";
        String choice2 = "160 cm";
        String choice3 = "158.5 cm";
        String correct = choice3;
        System.out.println(question);
        System.out.println("Choose one of the following: " +  choice1 + ", " + choice2 + ", " + choice3);
        try(Scanner inputChoice = new Scanner(System.in))
        {
            //String answer = inputChoice.next(); 
            String answer = inputChoice.nextLine();
             // TODO: compare string String.equals()
             if (answer.equals(correct)) {
                 // System.out.println (answer);
                 System.out.println("You really know Qiwen!!");
                
             } else {
                 // System.out.println (answer);
                 System.out.println("Hmm, you are tricked by her!!");
             }
        }
        // catch (IOException e){
        //    System.out.println(e.getMessage());
        // }

    }
}
