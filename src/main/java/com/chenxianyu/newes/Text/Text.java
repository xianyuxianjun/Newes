package com.chenxianyu.newes.Text;
import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Service.*;
import org.testng.annotations.Test;

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
    @Test
    public void test() {
        UserService userService = new UserService();
        //测试login方法
        System.out.println(userService.login("user", "password1"));
        //测试register方法
        User user = new User();
        user.setUsername("newuser");
        user.setPassword("newpassword");
        System.out.println(userService.register(user));
    }
    //测试updatePassword方法
@Test
    public void test1() {
        UserService userService = new UserService();
        System.out.println(userService.updatePassword(1, "newpassword"));
    }
    //测试updateUser方法
@Test
    public void test2() {
        UserService userService = new UserService();
        User user = new User();
        user.setUserId(1);
        user.setUsername("updateduser");
        System.out.println(userService.updateUser(user));
    }
    //测试getUser方法
@Test
    public void test3() {
        UserService userService = new UserService();
        User user = userService.getUser(1);
        System.out.println(user);
    }
}
