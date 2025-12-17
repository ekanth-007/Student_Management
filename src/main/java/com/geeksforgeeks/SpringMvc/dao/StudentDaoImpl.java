package com.geeksforgeeks.SpringMvc.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geeksforgeeks.SpringMvc.model.Student;

import java.util.List;

@Repository
@Transactional
public class StudentDaoImpl implements StudentDao {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Student save(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(student);
        return student;
    }

    @Override
    public Student findById(Long id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Student.class, id);
    }

    @Override
    public List<Student> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student", Student.class);
        return query.getResultList();
    }

    @Override
    public Student update(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.update(student);
        return student;
    }

    @Override
    public void delete(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Student student = session.get(Student.class, id);
        if (student != null) {
            session.delete(student);
        }
    }

    @Override
    public List<Student> findByCourse(String course) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student WHERE course = :course", Student.class);
        query.setParameter("course", course);
        return query.getResultList();
    }

    @Override
    public Student findByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query<Student> query = session.createQuery("FROM Student WHERE email = :email", Student.class);
        query.setParameter("email", email);
        return query.uniqueResult();
    }
}