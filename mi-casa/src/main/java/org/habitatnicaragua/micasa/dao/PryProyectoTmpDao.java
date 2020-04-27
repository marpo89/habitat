package org.habitatnicaragua.micasa.dao;

import org.habitatnicaragua.micasa.modelo.PryProyectoTmp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface PryProyectoTmpDao extends JpaRepository<PryProyectoTmp, Long>, JpaSpecificationExecutor<PryProyectoTmp> {

}
