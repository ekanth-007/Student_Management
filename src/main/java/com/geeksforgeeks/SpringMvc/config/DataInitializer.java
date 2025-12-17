package com.geeksforgeeks.SpringMvc.config;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.geeksforgeeks.SpringMvc.model.Student;
import com.geeksforgeeks.SpringMvc.service.StudentService;

@Component
public class DataInitializer implements InitializingBean {
    
    @Autowired
    private StudentService studentService;
    
    @Override
    public void afterPropertiesSet() throws Exception {
        // Check if demo data already exists
        if (studentService.getAllStudents().isEmpty()) {
            // Add demo students
            Student student1 = new Student();
            student1.setFirstName("John");
            student1.setLastName("Doe");
            student1.setEmail("john.doe@example.com");
            student1.setAddress("123 Main Street, New York, NY 10001");
            student1.setPhone("+1-555-0101");
            student1.setDob("1995-05-15");
            studentService.saveStudent(student1);
            
            Student student2 = new Student();
            student2.setFirstName("Jane");
            student2.setLastName("Smith");
            student2.setEmail("jane.smith@example.com");
            student2.setAddress("456 Oak Avenue, Los Angeles, CA 90001");
            student2.setPhone("+1-555-0102");
            student2.setDob("1998-08-22");
            studentService.saveStudent(student2);
            
            Student student3 = new Student();
            student3.setFirstName("Michael");
            student3.setLastName("Johnson");
            student3.setEmail("michael.johnson@example.com");
            student3.setAddress("789 Pine Road, Chicago, IL 60601");
            student3.setPhone("+1-555-0103");
            student3.setDob("1996-12-10");
            studentService.saveStudent(student3);
            
            Student student4 = new Student();
            student4.setFirstName("Emily");
            student4.setLastName("Williams");
            student4.setEmail("emily.williams@example.com");
            student4.setAddress("321 Elm Street, Houston, TX 77001");
            student4.setPhone("+1-555-0104");
            student4.setDob("1997-03-25");
            studentService.saveStudent(student4);
            
            Student student5 = new Student();
            student5.setFirstName("David");
            student5.setLastName("Brown");
            student5.setEmail("david.brown@example.com");
            student5.setAddress("654 Maple Drive, Phoenix, AZ 85001");
            student5.setPhone("+1-555-0105");
            student5.setDob("1999-07-18");
            studentService.saveStudent(student5);
        }
    }
}

