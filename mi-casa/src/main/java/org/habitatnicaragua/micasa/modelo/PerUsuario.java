package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.BootFacesDateTimePickerConverter;
import org.habitatnicaragua.micasa.util.SiNoJpaConverter;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idUsuario"})
@ToString
@Entity
@Table(name="PER_USUARIO")
@EntityListeners({AuditoriaListener.class})
public class PerUsuario implements Auditable, Identificable<String>, Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "ID_USUARIO", length=40, nullable=false)
	private String idUsuario;
	
	@Column(name = "CORREO", nullable=false, length=100)
	private String correo;
	
	@JsonIgnore
	@Column(name = "CLAVE", length=100)
	private String clave = null;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "ACTIVO", nullable=false)
	private Boolean activo = false;
	
	@JsonIgnore
	@Column(name = "CODIGO_ACTIVACION", length=255)
	private String codigoActivacion;
	
	@Column(name = "NOMBRES", length=255)
	private String nombres;
	
	@Temporal(TemporalType.DATE )
	@Column(name = "FECHA_NAC")
	private java.util.Date fechaNac;
	
	@Column(name = "SEXO", length=1)
	private String sexo;
	
	@Column(name = "CONTACTO", length=255)
	private String contacto;
	
	@Column(name = "TELEFONOS", length=255)
	private String telefonos;
	
	@Column(name = "DIRECCION_FISICA")
	private String direccionFisica;
	
	@Column(name = "FACEBOOK", length=300)
	private String facebook;
	
	@Column(name = "TWITTER",  length=300)
	private String twitter;
	
	@Column(name = "WHATSAPP", length=255)
	private String whatsapp;
	
	@Column(name = "TELEFONO_MOVIL", length=255)
	private String telefono_movil;
	
	@Column(name = "INSTAGRAM", length=300)
	private String instagram;
	
	@Column(name = "CIUDAD", length=255)
	private String ciudad;
	
	@Column(name = "MUNICIPIO", length=255)
	private String municipio;
	
	@Column(name = "SITIO_WEB", length=255)
	private String sitioWeb;
	
	@Column(name = "AVATAR", length=255)
	private String avatar;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "IR_PERFIL")
	private Boolean irPerfil = false;
		
	@Embedded
	private Auditoria auditoria = new Auditoria();

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
			name="SEG_ROL_USUARIO",
			joinColumns=@JoinColumn(name="ID_USUARIO", referencedColumnName="ID_USUARIO"),
			inverseJoinColumns=@JoinColumn(name="ROL", referencedColumnName="ROL"))
	private Set<SegRol> roles;
	
	
	public Set<SegRol> getRoles(){
		if(roles==null) roles = new HashSet<SegRol>();
		return roles;
	}
	
	public void setFechaNacString(String fechaNacString) {
		this.setFechaNac(BootFacesDateTimePickerConverter.toDate(fechaNacString));
	}
	
	@Transient
	private String rolesString;
	
	public String getRolesString() {
		if(rolesString==null && roles!=null) {
			String[] tmpRoles = new String[roles.size()];
			int i=0;
			for(SegRol segRol:roles) {
				tmpRoles[i] = segRol.getRol();
				i++;
			}
			rolesString = String.join(", ", tmpRoles);
		}
		
		return rolesString;
	}
	
	@Transient
	public String getFechaNacString() {
		return BootFacesDateTimePickerConverter.toString(this.getFechaNac());
	}
	
	@Transient
	private Boolean nivel1 = null;
	
	public boolean getNivel1() {
		return isNivel1();
	}
	
	public boolean isNivel1() {
		if(nivel1==null) {
			nivel1 = Boolean.FALSE;
			if(getRoles().size()==1) { 
				SegRol[] roles = getRoles().toArray(new SegRol[] {});
				if(Rol.USUARIO.name().equals(roles[0].getRol())) {
					nivel1 = Boolean.TRUE;
				}
			}
		}
		
		return nivel1.booleanValue();
	}
	
	@Transient
	private Boolean nivel2 = null;
	
	public boolean getNivel2() {
		return isNivel2();
	}
	
	public boolean isNivel2() {
		if(nivel2==null) {
			nivel2 = Boolean.FALSE;
			for(SegRol segRol : getRoles()) {
				if(Rol.MATERIAL.name().equals(segRol.getRol()) || Rol.FINANCIAMIENTO.name().equals(segRol.getRol())) {
					nivel2 = Boolean.TRUE;
					break;
				}
			}
		}
		
		return nivel2.booleanValue();
	}
	
	@Transient
	private Boolean admin = null;
	
	public boolean getAdmin() {
		return isAdmin();
	}
	
	public boolean isAdmin() {
		if(admin==null) {
			admin = Boolean.FALSE;
			for(SegRol segRol : getRoles()) {
				if(Rol.ADMIN.name().equals(segRol.getRol())) {
					admin = Boolean.TRUE;
					break;
				}
			}
		}
		return admin.booleanValue();
	}
	
	public void setIdUsuario(String idUsuario){
		this.idUsuario = StringUtils.trim(idUsuario);
	}

	@Override
	public String getIdentificador() {
		return idUsuario;
	}
	
	@Transient 
	public String getRutaAvatar() {
		if(StringUtils.isBlank(this.getAvatar())) {
			return "/img/no-profile-pic.png";
		}
		
		return "/archivos/avatar/" + this.getAvatar() + "?none=" + System.currentTimeMillis();
	}
	
}