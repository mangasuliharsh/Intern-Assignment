package com.auth.Demo.controllers;

import com.auth.Demo.entities.StudentEntity;
import com.auth.Demo.services.StudentSevice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class StudentController {

    private final StudentSevice studentSevice;

    public StudentController(StudentSevice studentSevice) {
        this.studentSevice = studentSevice;
    }

    @GetMapping("/home")
    public String showHomePage(Model model) {
        List<StudentEntity> students = studentSevice.getAllStudent();
        model.addAttribute("students", students);
        model.addAttribute("student", new StudentEntity());
        return "home";
    }

    @PostMapping("/addStudent")
    public String addStudent(@ModelAttribute StudentEntity student, Model model) {
        if (studentSevice.existsByUSN(student.getUsn())) {
            model.addAttribute("error", "Student Exists by USN " + student.getUsn());
        } else {
            studentSevice.addStudent(student);
            model.addAttribute("success", "Student Added Successfully");
        }

        List<StudentEntity> students = studentSevice.getAllStudent();
        model.addAttribute("students", students);
        model.addAttribute("student", new StudentEntity());

        return "home";
    }
}