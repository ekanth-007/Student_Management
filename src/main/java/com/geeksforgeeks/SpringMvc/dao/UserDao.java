package com.geeksforgeeks.SpringMvc.dao;

import com.geeksforgeeks.SpringMvc.model.User;

public interface UserDao {
    
    User save(User user);
    
    User findByUsername(String username);
    
    User findByEmail(String email);
    
    boolean existsByUsername(String username);
    
    boolean existsByEmail(String email);
    
    long countUsers(); // Add this method
}