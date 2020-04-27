package org.habitatnicaragua.micasa.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.habitatnicaragua.micasa.modelo.Calculadora;

@Repository
public interface CalculadoraDao extends JpaRepository<Calculadora, Long>, JpaSpecificationExecutor<Calculadora> {		
	
	@Query(value="select distinct this.entidadFinanc from Calculadora this")
	List<String> buscarTiposEntidades();
	
	@Query(value="select this from Calculadora this where this.entidadFinanc = :entidadFinanc")
	Calculadora buscarCalculadoraPorIF(@Param("entidadFinanc") Long entidadFinanc);

}
