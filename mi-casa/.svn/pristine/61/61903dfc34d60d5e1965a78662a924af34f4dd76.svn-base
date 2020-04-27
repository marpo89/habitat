package org.habitatnicaragua.micasa.util;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.transaction.annotation.Transactional;

public class JpaRepositoryUnoImpl <T, ID extends Serializable> extends SimpleJpaRepository<T, ID> implements JpaRepositoryUno<T, ID> {
    private final EntityManager entityManager;
    
    public JpaRepositoryUnoImpl(JpaEntityInformation<T, ?> entityInformation,  EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.entityManager = entityManager;
    }
    
    @Override
    @Transactional
    public void refresh(T entity) {
        entityManager.refresh(entity);
    }
}