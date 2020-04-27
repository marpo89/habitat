package org.habitatnicaragua.micasa.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(OftCupon.class)
public abstract class OftCupon_ {

	public static volatile SingularAttribute<OftCupon, Boolean> utilizado;
	public static volatile SingularAttribute<OftCupon, String> codigo;
	public static volatile SingularAttribute<OftCupon, OftOferta> oferta;
	public static volatile SingularAttribute<OftCupon, PerUsuario> usuario;
	public static volatile SingularAttribute<OftCupon, Long> idCupon;
	public static volatile SingularAttribute<OftCupon, Auditoria> auditoria;

}

