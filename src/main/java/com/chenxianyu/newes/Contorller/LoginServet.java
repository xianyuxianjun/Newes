package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.Result;
import com.chenxianyu.newes.Service.UserService;
import com.chenxianyu.newes.Utils.Res;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login")
public class LoginServet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserService userService = new UserService();
        if (userService.login(username, password)) {
            // 登录成功
            Res.success(resp);
            System.out.println("登录成功");
        } else {
            // 登录失败
            Res.error(resp, "Login failed");
            System.out.println("登录失败");
        }
    }
}
