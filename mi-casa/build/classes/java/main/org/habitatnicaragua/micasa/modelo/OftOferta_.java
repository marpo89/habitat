package org.habitatnicaragua.micasa.modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(OftOferta.class)
public abstract class OftOferta_ {

	public static volatile SingularAttribute<OftOferta, String> contenido;
	public static volatile SingularAttribute<OftOferta, PerUsuario> duenio;
	public static volatile SingularAttribute<OftOferta, String> archivo3;
	public static volatile SingularAttribute<OftOferta, String> archivo2;
	public static volatile SingularAttribute<OftOferta, Integer> limiteCantidad;
	public static volatile SingularAttribute<OftOferta, String> archivo1;
	public static volatile SingularAttribute<OftOferta, String> titulo;
	public static volatile SingularAttribute<OftOferta, Date> inicio;
	public static volatile SingularAttribute<OftOferta, Long> idOferta;
	public static volatile SingularAttribute<OftOferta, Date> fin;
	public static volatile SingularAttribute<OftOferta, Auditoria> auditoria;
	public static volatile SingularAttribute<OftOferta, Boolean> activo;

}

