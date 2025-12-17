package com.geeksforgeeks.SpringMvc.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.geeksforgeeks.SpringMvc.model.Role;
import com.geeksforgeeks.SpringMvc.model.User;
import com.geeksforgeeks.SpringMvc.service.UserService;

import java.util.Collections;
import java.util.HashSet;

@Controller
@RequestMapping("/register")
public class RegistrationController {
    
    @Autowired
    private UserService userService;

    @GetMapping
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping
    public String registerUser(@ModelAttribute("user") User user, Model model, RedirectAttributes redirectAttributes) {
        // Check if username already exists
        if (userService.existsByUsername(user.getUsername())) {
            model.addAttribute("error", "Username already exists!");
            return "register";
        }
        
        // Check if email already exists
        if (userService.existsByEmail(user.getEmail())) {
            model.addAttribute("error", "Email already exists!");
            return "register";
        }
        
        // Set default role as USER - will be handled properly in saveUser method
        Role userRole = new Role("ROLE_USER");
        user.setRoles(new HashSet<>(Collections.singletonList(userRole)));
        
        userService.saveUser(user);
        
        // Redirect to home page with success message
        redirectAttributes.addFlashAttribute("success", "Registration successful! You can now login.");
        return "redirect:/";
    }
}