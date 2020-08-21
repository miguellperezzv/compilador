
package com.analizador.sintax.analizador;
import java.io.IOException;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CommonTokenStream;



public class Main {

	private static final String EXTENSION = "txt";

	public static void main(String[] args)  {
		
		Ventana v = new Ventana(args);
		v.setVisible(true); 
		//v.analizar();
		
		

	}

}
