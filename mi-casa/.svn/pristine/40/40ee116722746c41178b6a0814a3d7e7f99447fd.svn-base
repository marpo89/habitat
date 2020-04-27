package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Convert;
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

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.util.SiNoJpaConverter;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idNodo"})
@ToString
@Entity
@Table(name="CMS_NODO")
@EntityListeners({AuditoriaListener.class})
public class CmsNodo implements Auditable,  Identificable<Long>, Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_NODO", nullable=false)
	private Long idNodo;
	
	@ManyToOne	
	@JoinColumn(name="ID_CMS_TIPO_NODO")
	private CatMaestro tipoNodo;
	
	@Column(name = "TITULO")
	private String titulo;
	
	@Column(name = "CONTENIDO")
	private String contenido;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "ACTIVO", nullable=false)
	private Boolean activo = true;
	
	@Column(name = "ENLACE")
	private String enlace;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "SISTEMA", nullable=false)
	private Boolean sistema = false;
	
	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public Long getIdentificador() {
		return idNodo;
	}

	@Transient
	public String getEnlaceWeb() {
		String enlaceWeb = "";
		
		if(isTipoPagina()) {
			enlaceWeb = "/publico/pagina.xhtml?p=" + getIdNodo();
		} else if(isTipoFolderBiblioteca()) {
			enlaceWeb = "/publico/archivos.xhtml?bib=" + getIdNodo();
		} else if(!StringUtils.isBlank(enlace)) {
			enlaceWeb = enlace;
		}
		
		return enlaceWeb;	
	}
	
	@Transient
	public boolean isTipoNodo(TipoNodo tipoNodo) {
		if(getTipoNodo()!=null && tipoNodo!=null && tipoNodo.name().equals(getTipoNodo().getNombre())) {
			return true;
		}
		
		return false;
	}
	
	@Transient
	public boolean isTipoFolderBiblioteca() {
		return isTipoNodo(TipoNodo.FOLDER_BIBLIOTECA);
	}
	
	@Transient
	public boolean isTipoPagina() {
		return isTipoNodo(TipoNodo.PAGINA);
	}
	
	@Transient
	public boolean isTipoEnlaces() {
		return isTipoNodo(TipoNodo.ENLACES);
	}
}
