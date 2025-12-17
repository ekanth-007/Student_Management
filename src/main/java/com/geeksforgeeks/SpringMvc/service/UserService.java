package com.geeksforgeeks.SpringMvc.service;


import org.springframework.security.core.userdetails.UserDetailsService;

import com.geeksforgeeks.SpringMvc.model.User;

public interface UserService extends UserDetailsService {
    
    User saveUser(User user);
    
    User findByUsername(String username);
    
    User findByEmail(String email);
    
    boolean existsByUsername(String username);
    
    boolean existsByEmail(String email);
    long countUsers();  // Added method
} 