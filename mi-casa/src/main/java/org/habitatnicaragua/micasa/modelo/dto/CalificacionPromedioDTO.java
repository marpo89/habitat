package org.habitatnicaragua.micasa.modelo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalificacionPromedioDTO {
	private long promedio;
	private long cantValoraciones;
	
	public CalificacionPromedioDTO(Long promedio, Long cantValoraciones) {
		this.promedio = promedio==null?0l:promedio;
		this.cantValoraciones = cantValoraciones==null?0l:cantValoraciones;
	}
	
	public CalificacionPromedioDTO(Double promedio, Long cantValoraciones) {
		this.promedio = promedio==null?0l:promedio.longValue();
		this.cantValoraciones = cantValoraciones==null?0l:cantValoraciones;
	}
}
