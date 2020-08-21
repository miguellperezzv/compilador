package com.analizador.sintax.analizador;

import java.util.ArrayList;
import java.util.Collection;

import org.antlr.v4.runtime.RecognitionException;

public class GestorError {

	ArrayList<RecognitionException> error = new ArrayList<>();
	@SuppressWarnings("unchecked")
	public void AgregarError(RecognitionException re) {
		error.add( re);
		
	}

}
