package org.habitatnicaragua.micasa.modelo.dto;

import org.habitatnicaragua.micasa.modelo.PerDireccion;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MarcadorMapaDTO {
	private String titulo;
	private String descripcion;
	private double latitud;
	private double longitud;
	
	public MarcadorMapaDTO() {
		
	}
	
	public MarcadorMapaDTO(String titulo, String descripcion, double latitud, double longitud) {
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.latitud = latitud;
		this.longitud = longitud;
	}
	
	public MarcadorMapaDTO(PerDireccion perDireccion) {
		this(perDireccion.getNombre(), perDireccion.getDireccion(), perDireccion.getLatitud(), perDireccion.getLongitud());
	}
}
