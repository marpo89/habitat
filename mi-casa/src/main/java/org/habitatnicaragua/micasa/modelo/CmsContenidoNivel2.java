package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idContenido"})
@ToString
@Entity
@Table(name="CMS_CONTENIDO")
@EntityListeners({AuditoriaListener.class})
public class CmsContenidoNivel2 implements Auditable,  Identificable<Long>, Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_CONTENIDO", nullable=false)
	private Long idContenido;
	
	@Column(name = "TITULO")
	private String titulo;
	
	@Column(name = "CONTENIDO")
	private String contenido;

	@Column(name = "ARCHIVO")
	private String archivo;

	@Column(name = "YOUTUBE")
	private String youtube;
	
	@ManyToOne
	@JoinColumn(name="DUENIO")
	private PerUsuario duenio;

	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public Long getIdentificador() {
		return idContenido;
	}

	@Transient
	public boolean isArchivoDisponible() {
		return !StringUtils.isBlank(archivo);
	}
	
	@Transient
	public String getRutaWebArchivo() {
		if(StringUtils.isBlank(archivo)) {
			return "";
		}
		
		return "/archivos" + this.archivo;
	}

	@Transient
	public boolean isArchivoImagen() {
		String extension = FilenameUtils.getExtension(archivo);
		
		extension = StringUtils.trimToEmpty(extension);
		
		if(StringUtils.isBlank(extension)) return false;
		
		if("jpg".equalsIgnoreCase(extension) || "gif".equalsIgnoreCase(extension) 
				|| "png".equalsIgnoreCase(extension) || "jpeg".equalsIgnoreCase(extension)) {
			return true;
		}
		
		return false;
	}
	
	@Transient
	public boolean isContenidoDisponible() {
		return !StringUtils.isBlank(contenido);
	}
	
	@Transient
	public boolean isYoutubeDisponible() {
		return !StringUtils.isBlank(youtube);
	}
	
	
	
}
