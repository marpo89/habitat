package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
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
@EqualsAndHashCode(of = { "id" })
@ToString
@Entity
@Table(name = "vw_proveedor")
@EntityListeners({ AuditoriaListener.class })
public class VwProveedor implements Auditable, Identificable<String>, Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	private String id;

	@Column(name = "ID_USUARIO")
	private String idUsuario;

	@Column(name = "CORREO")
	private String correo;

	@Convert(converter = SiNoJpaConverter.class)
	@Column(name = "ACTIVO")
	private Boolean activo = false;

	@Column(name = "CODIGO_ACTIVACION")
	private String codigoActivacion;

	@Column(name = "NOMBRES")
	private String nombres;

	@Column(name = "CONTACTO")
	private String contacto;

	@Column(name = "TELEFONOS")
	private String telefonos;

	@Column(name = "DIRECCION_FISICA")
	private String direccionFisica;

	@Column(name = "FACEBOOK")
	private String facebook;

	@Column(name = "TWITTER")
	private String twitter;

	@Column(name = "WHATSAPP")
	private String whatsapp;
	
	@Column(name = "TELEFONO_MOVIL")
	private String telefono_movil;
	
	@Column(name = "INSTAGRAM")
	private String instagram;
	
	@Column(name = "CIUDAD")
	private String ciudad;
	
	@Column(name = "MUNICIPIO")
	private String municipio;

	@Column(name = "SITIO_WEB")
	private String sitioWeb;

	@Column(name = "AVATAR")
	private String avatar;

	@Column(name = "PUNTAJE")
	private String puntaje;

	@Column(name = "ROL")
	private String rol;
	
	@Column(name = "CANT_OFERTAS")
	private Long cantOfertas;

	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public String getIdentificador() {
		return id;
	}

	@Transient
	public String getRutaAvatar() {
		if (StringUtils.isBlank(this.getAvatar())) {
			return "/img/no-profile-pic.png";
		}
		return "/archivos/avatar/" + this.getAvatar() + "?none=" + System.currentTimeMillis();
	}

}
