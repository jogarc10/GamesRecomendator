import jess.JessException;
import jess.Rete;
import jess.Value;


public class App {
	public static void main(String[] args) throws JessException {
		String ficheroReglas = "recommendations.clp";
		Rete UserRete = new Rete();
		
		try{
			Value v = UserRete.batch(ficheroReglas);
			System.out.println("Value " + v); 
		}catch(JessException je0){
			System.out.println("Error de lectura en " + ficheroReglas); 
			je0.printStackTrace();
		}
		
		//Cada una de estas tres partes carga el módulo necesario del archivo recommendations.clp
		UserRete.setFocus("CreateUserProfile");
		UserRete.run();
		
		
		
		
		
		UserRete.setFocus("ClassifyGames");
		UserRete.run();
		
		
		
		
		
		
		UserRete.setFocus("MatchUsersAndGames");
		UserRete.run();
		
		
	}

}
