grammar Simple;

@parser::header{ /*imports necesarios para utilziar el árbol semántico */
	import java.util.Map;
	import java.util.HashMap;
}

@parser::members{  /*REFERENCIA A LOS ATRIBUTOS QUE SE INGRESAN A LA CLASE GENERADORA DE SINTAXIS (Tabla Simbolo) */
	Map<String, Object> symbolTable = new HashMap<String, Object>();
}

programa:  VOID ID P_ABRIR P_CERRAR L_ABRIR sentencia* L_CERRAR ;


sentencia: declaracion | asignacion | println |condicional;
declaracion: INTEGER ID P_COMA
	 {symbolTable.put($ID.text,0);};
	 
asignacion: ID ASIGN expresion P_COMA
	{symbolTable.put($ID.text,$expresion.value);};
	
println: PRINTLN P_ABRIR expresion P_CERRAR P_COMA 
	{System.out.println($expresion.value);};
	
condicional : IF P_ABRIR expresion P_CERRAR 
	L_ABRIR sentencia* L_CERRAR
	ELSE 
	L_ABRIR sentencia* L_CERRAR;

expresion returns [Object value]: 
t1 = factor {$value = (int)$t1.value;}
(PLUS t2=factor{$value=(int)$value + (int)$t2.value;})*; 

factor returns [Object value]:  t1 = term {$value = (int)$t1.value;}
 (MULT	t2=term{$value=(int)$value * (int)$t2.value;})*;

term returns [Object value]: NUMERO {$value = Integer.parseInt($NUMERO.text);} 
| ID {$value = symbolTable.get($ID.text);}
| BOOLEAN 
| P_ABRIR expresion P_CERRAR;


VOID: 	'void';
PROGRAM: 'program';
INTEGER: 'int';
PRINTLN: 'println';
IF : 'if';
ELSE : 'else';



PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';

AND: '&&';
OR: '||';
NOT: '!';

MAYORQ: '>';
MENORQ: '<';
MAYORIGUALQ: '>=';
MENORIGUALQ: '<=';
IGUAL: '==';
NOIGUAL: '!=';

ASIGN: '=';

P_ABRIR : '(';
P_CERRAR : ')';
L_ABRIR : '{';
L_CERRAR : '}';
P_COMA : ';';

BOOLEAN : 'true' | 'false';

/*IDENTIFICADORES */
ID: [a-zA-Z_][a-zA-Z0-9_]*;
NUMERO: [0-9]+;

ESPACIO: [ \t\n\r]+ ->skip;
