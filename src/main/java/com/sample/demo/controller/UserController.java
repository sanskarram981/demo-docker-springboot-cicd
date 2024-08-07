package com.sample.demo.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1")
public class UserController {

    @GetMapping("/user")
    public ResponseEntity<?> getUser(){
        return new ResponseEntity<>("Hello from inside of the get mapping", HttpStatus.OK);
    }
}
