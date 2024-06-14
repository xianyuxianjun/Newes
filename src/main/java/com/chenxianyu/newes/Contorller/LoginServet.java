package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.Result;
import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Service.UserService;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.Res;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(urlPatterns = "/login")
public class LoginServet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户信息
        User user = RequestUtils.getParam(req, User.class);
        UserService userService = new UserService();
        if (userService.login(user.getUsername(), user.getPassword())) {
            // 登录成功
            Res.success(resp);
        } else {
            // 登录失败
            Res.error(resp, "Login failed");
        }
    }
}
