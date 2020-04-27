package org.habitatnicaragua.micasa.modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(PubPublicidad.class)
public abstract class PubPublicidad_ {

	public static volatile SingularAttribute<PubPublicidad, Long> maxImpresiones;
	public static volatile SingularAttribute<PubPublicidad, Date> inicio;
	public static volatile SingularAttribute<PubPublicidad, Date> fin;
	public static volatile SingularAttribute<PubPublicidad, CatMaestro> ubicacionAnuncio;
	public static volatile SingularAttribute<PubPublicidad, Long> idPublicidad;
	public static volatile SingularAttribute<PubPublicidad, String> archivo3;
	public static volatile SingularAttribute<PubPublicidad, Long> impresiones;
	public static volatile SingularAttribute<PubPublicidad, String> archivo2;
	public static volatile SingularAttribute<PubPublicidad, String> archivo1;
	public static volatile SingularAttribute<PubPublicidad, Long> maxClicks;
	public static volatile SingularAttribute<PubPublicidad, Long> clicks;
	public static volatile SingularAttribute<PubPublicidad, String> enlace;
	public static volatile SingularAttribute<PubPublicidad, Auditoria> auditoria;
	public static volatile SingularAttribute<PubPublicidad, Boolean> activo;

}

