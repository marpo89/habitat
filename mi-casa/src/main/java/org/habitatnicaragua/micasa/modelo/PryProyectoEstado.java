package org.habitatnicaragua.micasa.modelo;

public enum PryProyectoEstado {
	COTIZANDO("COTIZANDO", false), 
	PENDIENTE_PAGO("PENDIENTE PAGO", false),
	EN_DESARROLLO("EN DESARROLLO", false),
	VISITADO("VISITADO", false),
	TERMINADO("TERMINADO", true),
	DESCARTADO("DESCARTADO", true),
	CANCELADO_CLIENTE("CANCELADO POR CLIENTE", true);
	
	private String nombre;
	private boolean terminal;
	
	PryProyectoEstado(String nombre, boolean terminal) {
		this.nombre = nombre;
		this.terminal = terminal;
	}
	
	public String getNombre() {
		return nombre;
	}

	public boolean isTerminal() {
		return terminal;
	}
	
}
