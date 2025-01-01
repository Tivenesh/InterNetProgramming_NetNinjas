package com.tvpss.repository;

import com.tvpss.model.School;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

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

    @Transactional
    public void saveOrUpdate(School school) {
        Session session = sessionFactory.getCurrentSession();
        School existingSchool = session.get(School.class, school.getCode());
        if (existingSchool != null) {
            session.merge(school); // Update if exists
        } else {
            session.save(school);  // Save if new
        }
    }


    @Transactional
    public Optional<School> findById(String schoolCode) {
        return Optional.ofNullable(sessionFactory.getCurrentSession().get(School.class, schoolCode));
    }

    @Transactional
    public Optional<School> findBySchoolCode(String schoolCode) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM School s WHERE s.schoolCode = :schoolCode", School.class)
                .setParameter("schoolCode", schoolCode)
                .uniqueResultOptional();
    }

    @Transactional
    public List<School> findAll() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM School", School.class)
                .list();
    }

    @Transactional
    public School getSchoolById(Long id) {
        return sessionFactory.getCurrentSession().get(School.class, id);
    }

    @Transactional
    public School getSchoolInfo() {
        try {
            return sessionFactory.getCurrentSession()
                    .createQuery("FROM School", School.class)
                    .setMaxResults(1)
                    .uniqueResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Transactional
    public void deleteById(Long id) {
        Session session = sessionFactory.getCurrentSession();
        School school = session.get(School.class, id);
        if (school != null) {
            session.delete(school);
        }
    }
}
