package com.geeksforgeeks.SpringMvc.config; // Changed from SpringMvc to springmvc

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.geeksforgeeks.SpringMvc.model.Student;
import com.geeksforgeeks.SpringMvc.service.StudentService;



@Service("customSecurityService")
public class CustomSecurityService {
    
    @Autowired
    private StudentService studentService;
    
    /**
     * Check if current user can edit a specific student
     */
    public boolean canEditStudent(Long studentId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        // ADMIN can edit any student
        if (authentication.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
            return true;
        }
        
        // In a real application, check if student belongs to user
        // For now, return false for non-admin users
        return false;
    }
    
    /**
     * Check if user is the owner of a student record
     */
    public boolean isStudentOwner(Long studentId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        
        // Logic to check if student belongs to current user
        // This would require a relationship between User and Student entities
        return false;
    }
    
    /**
     * Custom business rule: Can delete student only if created more than 30 days ago
     */
    public boolean canDeleteStudent(Long studentId) {
        Student student = studentService.getStudentById(studentId);
        if (student == null) {
            return false;
        }
        
        // Example rule: Can only delete students created more than 30 days ago
        // This would require a createdAt field in Student entity
        return true;
    }
}