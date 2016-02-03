import java.util.Iterator;
import java.util.Scanner;

import jess.Fact;
import jess.JessException;
import jess.RU;
import jess.Rete;
import jess.Value;


public class App {
	static final int MAX = 20;
	
	public static void main(String[] args) throws JessException {
		String ficheroReglas = "recommendations.clp";
		Rete r = new Rete();
		String tmp;
		int inputInt = 0;
		String inputStr = "";
		int confirmation = 1;
		Scanner in = new Scanner(System.in);
		
		
		try{
			Value v = r.batch(ficheroReglas);
			System.out.println("Value " + v); 
		} catch(JessException je0){
			System.out.println("Error de lectura en " + ficheroReglas); 
			je0.printStackTrace();
		}
		while(confirmation == 1){
		
		r.reset();
		
		Fact f = new Fact("usuario", r); 
		
		System.out.println("Cuantos años tienes?: ");
		inputInt = in.nextInt();
		f.setSlotValue("edad", new Value(inputInt, RU.INTEGER)); 
		
		tmp = in.nextLine();
		
		System.out.println("Cuanto tiempo quieres dedicarle al juego?(poco, medio, mucho): ");
		inputStr = in.nextLine();
		f.setSlotValue("tiempoJuego", new Value(inputStr, RU.SYMBOL));
		
		System.out.println("De que dificultad quieres el juego?(facil, media, dificil): ");
		inputStr = in.nextLine();
		f.setSlotValue("dificultad", new Value(inputStr, RU.SYMBOL));
		
		System.out.println("Elige tu aficción de entre las siguientes(hogar, puzzles, salud, viajar): ");
		inputStr = in.nextLine();
		f.setSlotValue("aficion", new Value(inputStr, RU.SYMBOL));
		
		System.out.println("Cual es tu presupuesto para el juego?: ");
		inputInt = in.nextInt();
		f.setSlotValue("presupuesto", new Value(inputInt, RU.INTEGER));
		
		tmp = in.nextLine();
		
		System.out.println("De cuantos jugadores quieres el juego?(uno, dos, MasDeDos): ");
		inputStr = in.nextLine();
		f.setSlotValue("numeroJugadores", new Value(inputStr, RU.SYMBOL));
		

		r.assertFact(f);
		
		r.run();
		r.eval("(facts)");
		
		extractRecomendations(r);
		
		System.out.println("Quieres seguir pidiendo recomendaciones? 1(si), 0(no): ");
		inputInt = in.nextInt();
		System.out.println(inputStr);
		if(inputInt == 1 || inputInt == 0){
			confirmation = inputInt;
		}
		else{
			System.out.println("Error, cerrando el programa");
			confirmation = 0;
		}
		}
	}
	
	public static void extractRecomendations(Rete r){
		Iterator<Fact> i = r.listFacts();
		int numeroJuegos = 0;
		Value recomen;
		System.out.println("La lista de juegos recomendados para ti son:");
		while(i.hasNext() && numeroJuegos < MAX){
			Fact fact = i.next();
			if(fact.getName().equals("MAIN::Recomendation")){
				++numeroJuegos;
				try{
					recomen = fact.getSlotValue("nombreJuego");
					System.out.println(recomen);
				}catch(JessException excep){
					excep.printStackTrace();
				}
			}
		}
	}
	}

