package org.habitatnicaragua.micasa.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import org.habitatnicaragua.micasa.modelo.OftCupon;
import org.habitatnicaragua.micasa.modelo.PerUsuario;

@Repository
public interface OftCuponDao extends JpaRepository<OftCupon, Long>, JpaSpecificationExecutor<OftCupon> {		

	@Query(value="select count(this.idCupon) FROM OftCupon this WHERE this.codigo=:codigo")
	Long contarCuponesPorCodigo(@Param("codigo") String codigo);
	
	@Query(value="select this FROM OftCupon this WHERE this.oferta.idOferta=:idOferta AND this.usuario=:usuario")
	OftCupon buscarCuponPorUsuarioOferta(@Param("idOferta") Long idOferta, @Param("usuario") PerUsuario usuario);
	
	@Query(value="select this FROM OftCupon this WHERE this.codigo=:codigoCupon")
	OftCupon buscarCuponPorCodigo(@Param("codigoCupon") String codigoCupon);
	
	@Modifying
	@Query(value="DELETE FROM OftCupon this "
			+ " where this.oferta.idOferta = :P_ID_OFERTA AND this.usuario = :P_USUARIO LIMIT 1")
	int borrarCuponOferta(@Param("P_ID_OFERTA") Long idOferta, @Param("P_USUARIO") PerUsuario perUsuario);

}