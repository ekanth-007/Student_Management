package com.geeksforgeeks.SpringMvc.dao;



import java.util.List;

import com.geeksforgeeks.SpringMvc.model.Student;

public interface StudentDao {
    
    Student save(Student student);
    
    Student findById(Long id);
    
    List<Student> findAll();
    
    Student update(Student student);
    
    void delete(Long id);
    
    List<Student> findByCourse(String course);
    
    Student findByEmail(String email);
}