package com.chenxianyu.newes.Text;
import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Service.*;

public class Text {
    public static void main(String[] args) {
        UserService userService = new UserService();
        //测试login方法
        System.out.println(userService.login("user", "password1"));

        //测试register方法
        User user = new User();
        user.setUsername("newuser");
        user.setPassword("newpassword");
        System.out.println(userService.register(user));
    }
}
