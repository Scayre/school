package com.onlineschool.school.controllers;

import com.onlineschool.school.domain.Student;
import com.onlineschool.school.repos.StudentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

    @Autowired
    private StudentRepo studentRepo;

    @GetMapping("/")
    public String index(Model model) {
        Iterable<Student> students = studentRepo.findAll();
        model.addAttribute("students", students);
        return "index";
    }

    @GetMapping("/login")
    public String login(Model model) {
        return "login";
    }

    @GetMapping("/student-add")
    public String studentAdd(Model model) {
        return "student-add";
    }

    @PostMapping("/login")
    public String loginCheck(@RequestParam String login, @RequestParam String password, Model model){
        if(login.equals("admin") && password.equals("admin"))return "redirect:/";
        else return "redirect:/login";
    }

    @PostMapping("/student-add")
    public String studentAddTable(@RequestParam String student_name, @RequestParam String student_surname, @RequestParam String student_year, Model model){
        Student student = new Student(student_name,student_surname,student_year);
        studentRepo.save(student);
        return "redirect:/";
    }

    @PostMapping("/student-delete/{id}")
    public String studentDeleteTable(@PathVariable(value = "id") long id, Model model){
        Student student = studentRepo.findById(id).orElseThrow();
        studentRepo.delete(student);
        return "redirect:/";
    }

}
