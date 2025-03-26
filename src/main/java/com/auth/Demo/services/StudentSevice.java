package com.auth.Demo.services;

import com.auth.Demo.Repositories.StudentRepo;
import com.auth.Demo.entities.StudentEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentSevice {

    private final StudentRepo studentRepo;

    public StudentSevice(StudentRepo studentRepo) {
        this.studentRepo = studentRepo;
    }

    public void addStudent(StudentEntity student) {
        studentRepo.save(student);
    }

    public List<StudentEntity> getAllStudent() {
        return studentRepo.findAll();
    }

    public boolean existsByUSN(String USN) {
        return studentRepo.existsByUsn(USN);
    }
}
