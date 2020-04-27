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
import org.habitatnicaragua.micasa.util.FechasUno;
import org.habitatnicaragua.micasa.util.SiNoJpaConverter;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idOferta"})
@ToString
@Entity
@Table(name="OFT_OFERTA")
@EntityListeners({AuditoriaListener.class})
public class OftOferta implements OftOfertaInterfaz, Auditable,  Identificable<Long>, Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_OFERTA", nullable=false)
	private Long idOferta;
	
	@ManyToOne
	@JoinColumn(name="DUENIO")
	private PerUsuario duenio;
	
	@Column(name = "TITULO")
	private String titulo;
	
	@Column(name = "CONTENIDO")
	private String contenido;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "INICIO")
	private java.util.Date inicio;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "FIN")
	private java.util.Date fin;
	
	@Column(name = "LIMITE_CANTIDAD")
	private Integer limiteCantidad = 0;
	
	@Column(name = "ARCHIVO1")
	private String archivo1;
	
	@Column(name = "ARCHIVO2")
	private String archivo2;
	
	@Column(name = "ARCHIVO3")
	private String archivo3;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "ACTIVO", nullable=false)
	private Boolean activo = true;
	
	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public Long getIdentificador() {	
		return idOferta;
	}
	
	@Override
	@Transient
	public String getInicioUI() {
		if(inicio!=null) return FechasUno.dfDia.format(inicio);
		
		return "";
	}
	
	@Override
	@Transient
	public String getFinUI() {
		if(fin!=null) return FechasUno.dfDia.format(fin);
		
		return "";
	}
	
	@Override
	public void setInicioString(String inicioString) {
		this.setInicio(BootFacesDateTimePickerConverter.toDate(inicioString));
	}
	
	@Override
	@Transient
	public String getInicioString() {
		return BootFacesDateTimePickerConverter.toString(this.getInicio());
	}
	
	@Override
	public void setFinString(String finString) {
		this.setFin(BootFacesDateTimePickerConverter.toDate(finString));
	}
	
	@Override
	@Transient
	public String getFinString() {
		return BootFacesDateTimePickerConverter.toString(this.getFin());
	}
	
	@Override
	@Transient 
	public boolean isArchivo1Disponible() {
		return !StringUtils.isBlank(archivo1);
	}
	
	@Override
	@Transient 
	public boolean isArchivo2Disponible() {
		return !StringUtils.isBlank(archivo2);
	}
	
	@Override
	@Transient 
	public boolean isArchivo3Disponible() {
		return !StringUtils.isBlank(archivo3);
	}
	
	@Override
	@Transient 
	public String getRutaWebArchivo1() {
		if(StringUtils.isBlank(archivo1)) {
			return "";
		}
		
		return "/archivos" + this.archivo1;
	}
	
	@Override
	@Transient 
	public String getRutaWebArchivo2() {
		if(StringUtils.isBlank(archivo2)) {
			return "";
		}
		
		return "/archivos" + this.archivo2;
	}

	@Override
	@Transient 
	public String getRutaWebArchivo3() {
		if(StringUtils.isBlank(archivo3)) {
			return "";
		}
		
		return "/archivos" + this.archivo3;
	}

	@Override
	@Transient
	public String getContenidoCorto() {
		if (StringUtils.isBlank(contenido)) {
			return "";	
		}
		return StringUtils.abbreviate(contenido, LONGITUD_CONTENIDO_CORTO);
	}

	@Override
	@Transient
	public String getTituloCorto() {
		if (StringUtils.isBlank(titulo)) {
			return "";	
		}
		return StringUtils.abbreviate(titulo, LONGITUD_TITULO_CORTO);
	}
	
}
