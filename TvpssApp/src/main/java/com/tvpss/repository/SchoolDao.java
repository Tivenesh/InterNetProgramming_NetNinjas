package com.tvpss.repository;

import com.tvpss.model.School;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public class SchoolDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public long countTotalSchools() {
        return (long) sessionFactory.getCurrentSession()
                .createQuery("SELECT COUNT(s) FROM School s")
                .uniqueResult();
    }
}
