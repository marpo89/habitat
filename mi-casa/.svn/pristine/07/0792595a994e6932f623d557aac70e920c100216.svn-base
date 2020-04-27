package org.habitatnicaragua.micasa.modelo.dto;

import java.io.Serializable;

import org.habitatnicaragua.micasa.modelo.Auditable;
import org.habitatnicaragua.micasa.modelo.Auditoria;
import org.habitatnicaragua.micasa.modelo.Identificable;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.PryComentario;
import org.habitatnicaragua.micasa.modelo.PryProyecto;
import org.jsoup.Jsoup;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idComentario"})
@ToString
public class PryComentarioDTO implements Auditable, Identificable<Long>, Serializable {
	private static final long serialVersionUID = 1L;

	@JsonIgnore
	private PryComentario comentario;
	
	private Long idComentario;
	
	private PryProyecto idProyecto;
		
	private PerUsuario comentarista;
	
	private String contenido;
	
	private Auditoria auditoria = new Auditoria();
	
	private boolean propio = false;

	private Boolean visto = false;

	public PryComentarioDTO() {
		
	}
	
	public PryComentarioDTO(PryComentario comentario) {
		this.comentario = comentario;
		
		this.idComentario = comentario.getIdComentario();
		this.idProyecto = comentario.getIdProyecto();
		this.comentarista = comentario.getComentarista();
		this.auditoria = comentario.getAuditoria();
		this.contenido = Jsoup.parse(comentario.getContenido()).text();
		this.propio = false;
		this.visto = comentario.getVisto();
	}
	
	@Override
	public Long getIdentificador() {
		return idComentario;
	}
	
	public void evalPropiedad(PerUsuario usuarioActual) {
		this.setPropio(false);
		
		if(usuarioActual.isAdmin()) {
			this.setPropio(true);
		} else if(getComentarista()!=null && 
				usuarioActual.getIdUsuario().equals(getComentarista().getIdUsuario())){
			this.setPropio(true);
		}
	}
}
