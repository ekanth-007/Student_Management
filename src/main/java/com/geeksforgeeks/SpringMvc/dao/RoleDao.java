package com.geeksforgeeks.SpringMvc.dao;

import com.geeksforgeeks.SpringMvc.model.Role;

public interface RoleDao {
    
    Role save(Role role);
    
    Role findByName(String name);
    
    Role findOrCreateByName(String name);
}

