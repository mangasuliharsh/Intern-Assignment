package com.auth.Demo.controllers;

import com.auth.Demo.entities.Role;
import com.auth.Demo.entities.UserEntity;
import com.auth.Demo.services.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public LoginController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String getLogin(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getName())) {
            return "redirect:/home";
        }

        return "login";
    }

    @GetMapping("/register")
    public String getRegister() {
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute UserEntity user, Model model) {
        if (userService.emailExists(user.getEmail())) {
            model.addAttribute("error", "Email Already Exists");
            return "register";
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));


        if (user.getRole() == null) {
            user.setRole(Role.STUDENT);
        }

        userService.addUser(user);
        return "login";
    }

    @GetMapping("/faculty-login")
    public String getFacultyLogin() {
        return "faculty-login";
    }

    @GetMapping("/student-login")
    public String getStudentLogin() {
        return "student-login";
    }

    @GetMapping("/student-dashboard")
    public String getStudentDashboard() {
        return "student-dashboard";
    }

    @GetMapping("/faculty-dashboard")
    public String getFacultyDashboard() {
        return "faculty-dashboard";
    }
}