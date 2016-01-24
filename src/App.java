import java.util.Scanner;

import jess.Fact;
import jess.JessException;
import jess.RU;
import jess.Rete;
import jess.Value;


public class App {
	public static void main(String[] args) throws JessException {
		String ficheroReglas = "recommendations.clp";
		Rete r = new Rete();
		
		int inputInt = 0;
		String inputStr = "";
		Scanner in = new Scanner(System.in);
		
		try{
			Value v = r.batch(ficheroReglas);
			System.out.println("Value " + v); 
		} catch(JessException je0){
			System.out.println("Error de lectura en " + ficheroReglas); 
			je0.printStackTrace();
		}


		//Cada una de estas tres partes carga el módulo necesario del archivo recommendations.clp
		r.setFocus("createProfile");
		r.run();
		
		//System.out.println("Do you want exit: ");
		//inputInt = in.nextline();
		//r.eval("deftemplate usuario (slot edad (type NUMBER)) (slot tiempoJuego(type NUMBER)(allowed-values poco medio mucho)) (slot dificultad(type SYMBOL)(allowed-values facil medio dificil)) (slot aficion(type SYMBOL)(allowed-values salud, hogar, viajar, puzzles)) (slot presupuesto (type NUMBER)) (slot NumeroJugadores(type SYMBOL)(allowed-values uno, dos, mas de dos))");
		
		Fact f = new Fact("usuario", r); 
		
		//System.out.println("What's your age?: ");
		//inputInt = in.nextInt();
		f.setSlotValue("edad", new Value(10, RU.INTEGER)); 
		
		//System.out.println("What's your age?: ");
		//inputStr = in.nextLine();
		f.setSlotValue("tiempoJuego", new Value("poco", RU.SYMBOL));
		
		f.setSlotValue("dificultad", new Value("dificil", RU.SYMBOL));
		
		f.setSlotValue("aficion", new Value("hogar", RU.SYMBOL));
		
		f.setSlotValue("presupuesto", new Value(100, RU.INTEGER));
		
		f.setSlotValue("numeroJugadores", new Value("uno", RU.SYMBOL));
		
		r.assertFact(f);
		
		//r.eval("(reset)");
		r.eval("(facts)");
		r.eval("(rules)");
		r.eval("(facts)");
		
		//r.setFocus("ClassifyGames");
		//r.run();
		
		
		
		
		
		
		//r.setFocus("MatchUsersAndGames");
		//r.run();
	
	}

}
