package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Utils.BaseServlet;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.Res;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/getUser")
public class GetUserServlet extends BaseServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户信息
        User user = RequestUtils.getParam(req, User.class);
        User user1 = userService.getUser(user.getUserId());
        if (user1 != null) {
            // 获取用户信息成功
            Res.success(resp, user1);
        } else {
            // 获取用户信息失败
            Res.error(resp, "Get user failed");
        }
    }
}
