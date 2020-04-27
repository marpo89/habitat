package org.habitatnicaragua.micasa.util;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface JpaRepositoryUno<T, ID extends Serializable> extends JpaRepository<T, ID> {
    void refresh(T entity);
}