package com.chenxianyu.newes.Text;
import com.chenxianyu.newes.Service.*;

public class Text {
    public static void main(String[] args) {
        UserService userService = new UserService();
        //测试login方法
        System.out.println(userService.login("user1", "password1"));
    }
}
