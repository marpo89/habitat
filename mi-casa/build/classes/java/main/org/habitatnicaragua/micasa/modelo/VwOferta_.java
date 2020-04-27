package org.habitatnicaragua.micasa.modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(VwOferta.class)
public abstract class VwOferta_ {

	public static volatile SingularAttribute<VwOferta, String> contenido;
	public static volatile SingularAttribute<VwOferta, PerUsuario> duenio;
	public static volatile SingularAttribute<VwOferta, String> titulo;
	public static volatile SingularAttribute<VwOferta, Date> inicio;
	public static volatile SingularAttribute<VwOferta, Long> idOferta;
	public static volatile SingularAttribute<VwOferta, Date> fin;
	public static volatile SingularAttribute<VwOferta, Integer> tomadas;
	public static volatile SingularAttribute<VwOferta, String> archivo3;
	public static volatile SingularAttribute<VwOferta, String> archivo2;
	public static volatile SingularAttribute<VwOferta, Integer> limiteCantidad;
	public static volatile SingularAttribute<VwOferta, String> archivo1;
	public static volatile SingularAttribute<VwOferta, Auditoria> auditoria;
	public static volatile SingularAttribute<VwOferta, Boolean> activo;

}

