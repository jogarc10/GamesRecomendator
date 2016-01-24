import jess.JessException;
import jess.Rete;
import jess.Value;


public class App {
	public static void main(String[] args) throws JessException {
		String ficheroReglas = "recommendations.clp";
		Rete UserRete = new Rete();
		
		int inputInt = 0;
		String inputStr = "";
		Scanner in = new Scanner(System.in);
		
		try{
			Value v = UserRete.batch(ficheroReglas);
			System.out.println("Value " + v); 
		} catch(JessException je0){
			System.out.println("Error de lectura en " + ficheroReglas); 
			je0.printStackTrace();
		}
		
		//System.out.println("Do you want exit: ");
		//inputInt = in.nextline();

		System.out.println("What's your age?: ");
		inputInt = in.nextInt();

		System.out.println("What's your age?: ");
		inputStr = in.nextLine();



		//Cada una de estas tres partes carga el módulo necesario del archivo recommendations.clp
		UserRete.setFocus("CreateUserProfile");
		UserRete.run();
		
		
		
		
		
		UserRete.setFocus("ClassifyGames");
		UserRete.run();
		
		
		
		
		
		
		UserRete.setFocus("MatchUsersAndGames");
		UserRete.run();
	
	}

}
