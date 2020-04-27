package org.habitatnicaragua.micasa.modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(PerUsuario.class)
public abstract class PerUsuario_ {

	public static volatile SingularAttribute<PerUsuario, String> whatsapp;
	public static volatile SingularAttribute<PerUsuario, String> direccionFisica;
	public static volatile SingularAttribute<PerUsuario, String> clave;
	public static volatile SingularAttribute<PerUsuario, String> contacto;
	public static volatile SingularAttribute<PerUsuario, String> codigoActivacion;
	public static volatile SingularAttribute<PerUsuario, String> idUsuario;
	public static volatile SingularAttribute<PerUsuario, String> facebook;
	public static volatile SetAttribute<PerUsuario, SegRol> roles;
	public static volatile SingularAttribute<PerUsuario, String> avatar;
	public static volatile SingularAttribute<PerUsuario, String> nombres;
	public static volatile SingularAttribute<PerUsuario, Date> fechaNac;
	public static volatile SingularAttribute<PerUsuario, String> twitter;
	public static volatile SingularAttribute<PerUsuario, String> sitioWeb;
	public static volatile SingularAttribute<PerUsuario, String> correo;
	public static volatile SingularAttribute<PerUsuario, String> telefonos;
	public static volatile SingularAttribute<PerUsuario, String> sexo;
	public static volatile SingularAttribute<PerUsuario, Auditoria> auditoria;
	public static volatile SingularAttribute<PerUsuario, Boolean> activo;
	public static volatile SingularAttribute<PerUsuario, Boolean> irPerfil;

}

