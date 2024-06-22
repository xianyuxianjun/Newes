package com.chenxianyu.newes.Service;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
class UserServiceTest {
    UserService userService = new UserService();
    @Test
    void deleteUser() {
        System.out.println(userService.deleteUser(2));
    }
}