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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.BootFacesDateTimePickerConverter;
import org.habitatnicaragua.micasa.util.SiNoJpaConverter;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idPublicidad"})
@ToString
@Entity
@Table(name="PUB_PUBLICIDAD")
@EntityListeners({AuditoriaListener.class})
public class PubPublicidad implements Auditable, Identificable<Long>, Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_ANUNCIO", nullable=false)
	private Long idPublicidad;
	
	@Temporal(TemporalType.DATE )
	@Column(name = "INICIO")
	private java.util.Date inicio;
	
	@Temporal(TemporalType.DATE )
	@Column(name = "FIN")
	private java.util.Date fin;
	
	@Column(name="IMPRESIONES")
	private Long impresiones=0L;
	
	@Column(name="MAX_IMPRESIONES")
	private Long maxImpresiones=0L;
	
	@Column(name="CLICKS")
	private Long clicks=0L;
	
	@Column(name="MAX_CLICKS")
	private Long maxClicks=0L;
	
	@Column(name = "ENLACE")
	private String enlace;
	
	@Column(name = "ARCHIVO1")
	private String archivo1;
	
	@Column(name = "ARCHIVO2")
	private String archivo2;
	
	@Column(name = "ARCHIVO3")
	private String archivo3;
	
	@ManyToOne
	@JoinColumn(name="ID_UBICACION_ANUNCIO")
	private CatMaestro ubicacionAnuncio;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "ACTIVO", nullable=false)
	private Boolean activo = false;
	
	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public Long getIdentificador() {
		return idPublicidad;
	}
	
	public void setFechaInicio(String fechaInicio) {
		this.setInicio(BootFacesDateTimePickerConverter.toDate(fechaInicio));
	}
	
	public void setFechaFin(String fechaFin) {
		this.setFin(BootFacesDateTimePickerConverter.toDate(fechaFin));
	}
	
	@Transient
	public String getFechaInicio() {
		return BootFacesDateTimePickerConverter.toString(this.getInicio());
	}
	
	@Transient
	public String getFechaFin() {
		return BootFacesDateTimePickerConverter.toString(this.getFin());
	}
	
	@Transient 
	public boolean isArchivo1Disponible() {
		return !StringUtils.isBlank(archivo1);
	}
	
	@Transient 
	public boolean isArchivo2Disponible() {
		return !StringUtils.isBlank(archivo2);
	}
	
	@Transient 
	public boolean isArchivo3Disponible() {
		return !StringUtils.isBlank(archivo3);
	}
	
	@Transient 
	public String getRutaWebArchivo1() {
		if(StringUtils.isBlank(archivo1)) {
			return "";
		}
		
		return "/archivos" + this.archivo1;
	}
	
	@Transient 
	public String getRutaWebArchivo2() {
		if(StringUtils.isBlank(archivo2)) {
			return "";
		}
		
		return "/archivos" + this.archivo2;
	}
	
	@Transient 
	public String getRutaWebArchivo3() {
		if(StringUtils.isBlank(archivo3)) {
			return "";
		}
		
		return "/archivos" + this.archivo3;
	}

}
