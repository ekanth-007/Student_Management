package com.geeksforgeeks.SpringMvc.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geeksforgeeks.SpringMvc.dao.StudentDao;
import com.geeksforgeeks.SpringMvc.model.Student;

import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    
    @Autowired
    private StudentDao studentDao;

    @Override
    public Student saveStudent(Student student) {
        return studentDao.save(student);
    }

    @Override
    public Student getStudentById(Long id) {
        return studentDao.findById(id);
    }

    @Override
    public List<Student> getAllStudents() {
        return studentDao.findAll();
    }

    @Override
    public Student updateStudent(Student student) {
        return studentDao.update(student);
    }

    @Override
    public void deleteStudent(Long id) {
        studentDao.delete(id);
    }

    @Override
    public List<Student> getStudentsByCourse(String course) {
        return studentDao.findByCourse(course);
    }

    @Override
    public Student getStudentByEmail(String email) {
        return studentDao.findByEmail(email);
    }
}