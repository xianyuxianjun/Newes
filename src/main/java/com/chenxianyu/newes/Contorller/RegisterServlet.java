package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Utils.UserServlet;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.Res;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/register")
public class RegisterServlet extends UserServlet {
    //注册
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户信息
        User user = RequestUtils.getParam(req, User.class);
        //调用service层的register方法
        boolean register = userService.register(user);
            if (register) {
                Res.success(resp);
            } else {
                Res.error(resp, "Register failed");
            }
        }

}
