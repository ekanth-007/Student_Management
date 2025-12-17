package com.geeksforgeeks.SpringMvc.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geeksforgeeks.SpringMvc.model.Role;

@Repository
@Transactional
public class RoleDaoImpl implements RoleDao {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Role save(Role role) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(role);
        return role;
    }

    @Override
    public Role findByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query<Role> query = session.createQuery("FROM Role WHERE name = :name", Role.class);
        query.setParameter("name", name);
        return query.uniqueResult();
    }

    @Override
    public Role findOrCreateByName(String name) {
        Role role = findByName(name);
        if (role == null) {
            role = new Role(name);
            save(role);
        }
        return role;
    }
}

