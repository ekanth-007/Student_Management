package com.geeksforgeeks.SpringMvc.service;


import java.util.List;

import com.geeksforgeeks.SpringMvc.model.Student;

public interface StudentService {
    
    Student saveStudent(Student student);
    
    Student getStudentById(Long id);
    
    List<Student> getAllStudents();
    
    Student updateStudent(Student student);
    
    void deleteStudent(Long id);
    
    List<Student> getStudentsByCourse(String course);
    
    Student getStudentByEmail(String email);
}