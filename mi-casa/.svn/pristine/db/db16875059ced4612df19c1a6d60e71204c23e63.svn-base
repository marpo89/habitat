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

import org.habitatnicaragua.micasa.controlador.comun.BootFacesDateTimePickerConverter;
import org.habitatnicaragua.micasa.util.SiNoJpaConverter;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idProyecto"})
@ToString
@Entity
@Table(name="PRY_PROYECTO")
@EntityListeners({AuditoriaListener.class})
public class PryProyecto implements Auditable, Identificable<Long>, Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_PROYECTO", nullable=false)
	private Long idProyecto;
	
	@Column(name = "DESCRIPCION")
	private String descripcion;

	@ManyToOne
	@JoinColumn(name="ID_PRY_FORMA_PAGO")
	private CatMaestro idPryFormaPago;

	@ManyToOne
	@JoinColumn(name="ID_BANCO")
	private CatMaestro idBanco;
	
	@Temporal(TemporalType.DATE )
	@Column(name = "FECHA_PAGO")
	private java.util.Date fechaPago;
	
	@Column(name = "COMPROBANTE", length=255)
	private String comprobante;
	
	@Column(name = "ESPACIOS_MEJORA")
	private String espaciosMejora;

	@Column(name = "MATERIALES_MEJORA")
	private String materialesMejora;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "PRESUPUESTO", nullable=false)
	private Boolean presupuesto = false;
	
	@Column(name = "MONTO_PRESUPUESTO")
	private Double montoPresupuesto;
	
	@ManyToOne
	@JoinColumn(name="ID_MONEDA")
	private CatMaestro idMoneda;

	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "TIENE_ALBANIL", nullable=false)
	private Boolean tieneAlbanil = false;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "PRESENTE_VISITA", nullable=false)
	private Boolean presenteVisita = false;
	
	@Column(name = "NOMBRE_PER_ATENCION_VISITA", length=255)
	private String nombrePerAtencionVisita;
	
	@Column(name = "FECHA_HORA_DISPONIBLE")
	private String fechaHoraDisponible;
	
	@ManyToOne
	@JoinColumn(name="ID_ESTADO", nullable=false)
	private CatMaestro estado;
			
	@ManyToOne
	@JoinColumn(name="ID_PRY_TIPO_SERVICIO")
	private CatMaestro tipoServicio;
	
	@ManyToOne
	@JoinColumn(name="USUARIO_DUENIO")
	private PerUsuario duenio;
	
	@ManyToOne
	@JoinColumn(name="USUARIO_TECNICO")
	private PerUsuario tecnico;
		
	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public Long getIdentificador() {
		return idProyecto;
	}
	
	public void setFechaPagoString(String fechaPagoString) {
		this.setFechaPago(BootFacesDateTimePickerConverter.toDate(fechaPagoString));
	}
	
	@Transient
	public String getFechaPagoString() {
		return BootFacesDateTimePickerConverter.toString(this.getFechaPago());
	}
	
	@Transient
	public PryProyectoEstado getEstadoEnum() {
		if(estado==null) return null;
		
		for(PryProyectoEstado e:PryProyectoEstado.values()) {
			if(e.getNombre().equals(estado.getNombre())) {
				return e;
			}
		}
		
		return null;
	}
}
