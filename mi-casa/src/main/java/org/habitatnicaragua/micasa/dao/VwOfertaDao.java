package org.habitatnicaragua.micasa.dao;

import org.habitatnicaragua.micasa.modelo.VwOferta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface VwOfertaDao extends JpaRepository<VwOferta, Long>, JpaSpecificationExecutor<VwOferta> {

}