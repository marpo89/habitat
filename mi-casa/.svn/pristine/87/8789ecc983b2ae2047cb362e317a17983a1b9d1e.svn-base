package org.habitatnicaragua.micasa.dao;


import org.habitatnicaragua.micasa.modelo.SegLogin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SegLoginDao extends JpaRepository<SegLogin, Long>, JpaSpecificationExecutor<SegLogin> {		

	@Query("SELECT this FROM SegLogin this order by fecha desc ")
	Page<SegLogin> ListarSegLogin(Pageable paginacion);
	
	@Query(value="select this from SegLogin this where upper(trim(this.correo)) = upper(trim(:P_correo)) AND exitoso=true")
	SegLogin buscarUsuarioLogin(@Param("P_correo") String correo);
	
}