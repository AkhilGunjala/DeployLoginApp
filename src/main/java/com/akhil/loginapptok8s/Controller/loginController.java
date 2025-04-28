package com.akhil.loginapptok8s.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class loginController {

    @GetMapping("/login")
    public String login() {
        System.out.println("login");
        return "login";
    }
}
