package org.habitatnicaragua.micasa.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.habitatnicaragua.micasa.modelo.CalcParametros;

@Repository
public interface CalcParametrosDao extends JpaRepository<CalcParametros, Long>, JpaSpecificationExecutor<CalcParametros> {		
	
	@Query(value="select distinct this.nombreParametro from CalcParametros this")
	List<String> buscarTiposParametros();

}
