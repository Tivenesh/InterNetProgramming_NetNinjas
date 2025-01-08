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
    public long countActiveSchools() {
        return (long) sessionFactory.getCurrentSession()
                .createQuery("SELECT COUNT(s) FROM School s WHERE s.versionStatus = 'Active'")
                .uniqueResult();
    }

    @Transactional
    public long countInactiveSchools() {
        return (long) sessionFactory.getCurrentSession()
                .createQuery("SELECT COUNT(s) FROM School s WHERE s.versionStatus = 'Inactive'")
                .uniqueResult();
    }

    @Transactional
    public void saveOrUpdate(School school) {
        Session session = sessionFactory.getCurrentSession();
        School existingSchool = session.get(School.class, school.getCode());
        if (existingSchool != null) {
            // Retain version status unless explicitly set
            if (school.getVersionStatus() == null) {
                school.setVersionStatus(existingSchool.getVersionStatus());
            }
            session.merge(school);
        } else {
            // Default to Inactive for new schools
            school.setVersionStatus(school.getVersionStatus() != null ? school.getVersionStatus() : "Inactive");
            session.save(school);
        }
    }

    @Transactional
    public Optional<School> findByCode(String schoolCode) {
        return Optional.ofNullable(sessionFactory.getCurrentSession().get(School.class, schoolCode));
    }
    
    @Transactional
    public void updateVersionStatus(String schoolCode, String versionStatus) {
        Session session = sessionFactory.getCurrentSession();
        School school = session.get(School.class, schoolCode);
        if (school != null) {
            school.setVersionStatus(versionStatus);
            session.update(school);
        }
    }
    

    @Transactional
    public long countTotalSchools() {
        return (long) sessionFactory.getCurrentSession()
                .createQuery("SELECT COUNT(s) FROM School s")
                .uniqueResult();
    }

    
    @Transactional
    public List<School> getAllSchools() {
        return findAll();
    }

    @Transactional
    public List<School> findAll() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM School", School.class)
                .list();
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
    public School getSchoolById(Long id) {
        return sessionFactory.getCurrentSession().get(School.class, id);
    }

    
    @Transactional
    public School getSchoolBySchoolCode(String schoolCode) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM School s WHERE s.code = :schoolCode", School.class)
                .setParameter("schoolCode", schoolCode)
                .uniqueResult();
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