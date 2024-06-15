package com.chenxianyu.newes.Text;

import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.testng.annotations.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserServiceTest {
    private UserService userService;

    @BeforeEach
    void setUp() {
        userService = new UserService();
    }

    @Test
    void login() {
        assertTrue(userService.login("user1", "password1"));
        assertFalse(userService.login("user", "wrongpassword"));
    }

    @Test
    void register() {
        User user = new User();
        user.setUsername("newuser");
        user.setPassword("newpassword");
        assertTrue(userService.register(user));
    }

    @Test
    void updatePassword() {
        assertTrue(userService.updatePassword(1, "newpassword"));
    }

    @Test
    void updateUser() {
        User user = new User();
        user.setUserId(1);
        user.setUsername("updateduser");
        assertTrue(userService.updateUser(user));
    }

    @Test
    void getUser() {
        User user = userService.getUser(1);
        assertNotNull(user);
        assertEquals(1, user.getUserId());
    }
}