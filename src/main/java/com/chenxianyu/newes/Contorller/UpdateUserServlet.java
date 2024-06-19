package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.Res;
import com.chenxianyu.newes.Utils.UserServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/updateUser")
public class UpdateUserServlet extends UserServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取提交的信息
        User user = RequestUtils.getParam(req, User.class);

        if (userService.updateUser(user)) {
            // 更新用户信息成功
            Res.success(resp);
        } else {
            // 更新用户信息失败
            Res.error(resp, "Update user failed");
        }
    }
}
