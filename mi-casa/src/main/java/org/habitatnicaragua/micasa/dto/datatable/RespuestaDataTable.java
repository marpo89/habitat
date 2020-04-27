package org.habitatnicaragua.micasa.dto.datatable;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.domain.Page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RespuestaDataTable<E> implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer draw;
	private Long recordsTotal;
	private Long recordsFiltered;
	private List<E> data;
	
	public RespuestaDataTable(SolicitudDataTable solicitud, Page<E> pagina){
		this.draw = solicitud.getDraw();
		this.data = pagina.getContent();
		this.recordsTotal = pagina.getTotalElements();
		this.recordsFiltered = pagina.getTotalElements();
	}
}

