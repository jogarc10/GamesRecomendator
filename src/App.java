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
		String tmp;
		double inputDouble;
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
		
		//r.eval("deftemplate usuario (slot edad (type NUMBER)) (slot tiempoJuego(type NUMBER)(allowed-values poco medio mucho)) (slot dificultad(type SYMBOL)(allowed-values facil medio dificil)) (slot aficion(type SYMBOL)(allowed-values salud, hogar, viajar, puzzles)) (slot presupuesto (type NUMBER)) (slot NumeroJugadores(type SYMBOL)(allowed-values uno, dos, mas de dos))");
		
		Fact f = new Fact("usuario", r); 
		
		//System.out.println("Cuantos años tienes?: ");
		//inputInt = in.nextInt();
		f.setSlotValue("edad", new Value(10, RU.INTEGER)); 
		
		//tmp = in.nextLine();
		
		//System.out.println("Cuanto tiempo quieres dedicarle al juego?(poco, medio, mucho): ");
		//inputStr = in.nextLine();
		f.setSlotValue("tiempoJuego", new Value("poco", RU.SYMBOL));
		
		//System.out.println("De que dificultad quieres el juego?(facil, media, dificil): ");
		//inputStr = in.nextLine();
		f.setSlotValue("dificultad", new Value("media", RU.SYMBOL));
		
		//System.out.println("Elige tu aficción de entre las siguientes(): ");
		//inputStr = in.nextLine();
		f.setSlotValue("aficion", new Value("hogar", RU.SYMBOL));
		
		//System.out.println("Cual es tu presupuesto para el juego?: ");
		//inputDouble = in.nextDouble();
		f.setSlotValue("presupuesto", new Value(100, RU.INTEGER));
		
		//tmp = in.nextLine();
		
		//System.out.println("De cuantos jugadores quieres el juego?(uno, dos, MasDeDos): ");
		//inputStr = in.nextLine();
		f.setSlotValue("numeroJugadores", new Value("uno", RU.SYMBOL));
		
		r.assertFact(f);
		
		r.run();
		r.eval("(facts)");
		r.eval("(rules)");
		
		
		//r.setFocus("ClassifyGames");
		//r.run();
		
		
		//r.setFocus("MatchUsersAndGames");
		//r.run();
	
	}

}
