package org.habitatnicaragua.micasa.modelo.dto;

import java.io.Serializable;

import org.habitatnicaragua.micasa.modelo.Auditable;
import org.habitatnicaragua.micasa.modelo.Auditoria;
import org.habitatnicaragua.micasa.modelo.CmsContenidoNivel2;
import org.habitatnicaragua.micasa.modelo.Identificable;
import org.habitatnicaragua.micasa.modelo.PerUsuario;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idContenido"})
@ToString
public class CmsContenidoNivel2DTO implements Auditable, Identificable<Long>, Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long idContenido;
	private String titulo;
	private String contenido;
	private String archivo;
	private String youtube;
	private PerUsuario duenio;
	private Auditoria auditoria = new Auditoria();
	
	private Long identificador;
	private boolean archivoDisponible;
	private String rutaWebArchivo;
	private boolean archivoImagen;
	private boolean contenidoDisponible;
	private boolean youtubeDisponible;
	
	private boolean propio = false;
	
	public CmsContenidoNivel2DTO() {
		
	}
	
	public CmsContenidoNivel2DTO(CmsContenidoNivel2 cmsContenidoNivel2) {
		this.idContenido = cmsContenidoNivel2.getIdContenido();
		this.titulo = cmsContenidoNivel2.getTitulo();
		this.contenido = cmsContenidoNivel2.getContenido();
		this.archivo = cmsContenidoNivel2.getArchivo();
		this.youtube = cmsContenidoNivel2.getYoutube();
		this.duenio = cmsContenidoNivel2.getDuenio();
		this.auditoria = cmsContenidoNivel2.getAuditoria();
		
		this.identificador = cmsContenidoNivel2.getIdentificador();
		this.archivoDisponible = cmsContenidoNivel2.isArchivoDisponible();
		this.rutaWebArchivo = cmsContenidoNivel2.getRutaWebArchivo();
		this.archivoImagen = cmsContenidoNivel2.isArchivoImagen();
		this.contenidoDisponible = cmsContenidoNivel2.isContenidoDisponible();
		this.youtubeDisponible = cmsContenidoNivel2.isYoutubeDisponible();
		
		this.propio = false;
	}
}
