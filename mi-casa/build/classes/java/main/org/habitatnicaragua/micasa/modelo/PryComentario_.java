package org.habitatnicaragua.micasa.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(PryComentario.class)
public abstract class PryComentario_ {

	public static volatile SingularAttribute<PryComentario, PryProyecto> idProyecto;
	public static volatile SingularAttribute<PryComentario, PerUsuario> comentarista;
	public static volatile SingularAttribute<PryComentario, String> contenido;
	public static volatile SingularAttribute<PryComentario, Boolean> visto;
	public static volatile SingularAttribute<PryComentario, Auditoria> auditoria;
	public static volatile SingularAttribute<PryComentario, Long> idComentario;
	public static volatile SingularAttribute<PryComentario, Boolean> activo;

}

