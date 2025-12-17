package com.geeksforgeeks.SpringMvc.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {
    
    @GetMapping
    public String adminDashboard(Model model) {
        model.addAttribute("title", "Admin Dashboard");
        model.addAttribute("message", "Welcome to Admin Dashboard");
        return "admin";
    }
}