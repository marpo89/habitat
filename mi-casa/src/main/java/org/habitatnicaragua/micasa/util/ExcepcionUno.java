package org.habitatnicaragua.micasa.util;

public class ExcepcionUno extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public ExcepcionUno() {
		super();
	}

	public ExcepcionUno(String message, Throwable cause) {
		super(message, cause);
	}

	public ExcepcionUno(String message) {
		super(message);
	}

	public ExcepcionUno(Throwable cause) {
		super(getCausaOriginal(cause));
	}

	public static ExcepcionUno campoRequerido(String campo){
		return new ExcepcionUno ("El campo " + campo + " es requerido, por favor complete.");
	}

	public static ExcepcionUno permisoDenegado(){
		return new ExcepcionUno ("Permiso denegado.");
	}
	
	public static ExcepcionUno textoSucio(String campo){ 
		return new ExcepcionUno ("El contenido del campo " + campo + " no es válido, por favor corrija.");
	}
	
	
	public static ExcepcionUno objetoNull(){ 
		return new ExcepcionUno("Faltan datos para proseguir.");
	}
	
	public static ExcepcionUno parametroInvalido(){ 
		return new ExcepcionUno("Parámetro inválido.");
	}
	
	public static ExcepcionUno contenidoInseguro(){ 
		return new ExcepcionUno("El contenido no es seguro.");
	}
	
	public static Throwable getCausaOriginal(Throwable t){
		if(t==null) return null;
		
		int max = 10;
		while(t.getCause()!=null){
			t = t.getCause();
			max--;
			if(max<=0) break;
		}
		
		return t;
	}

}
