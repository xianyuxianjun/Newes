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
@WebServlet(urlPatterns = "/deleteUser")
public class DeleteUserServelt extends UserServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = RequestUtils.getParam(req, User.class);
        //获取参数
        int id = user.getUserId();
        System.out.println("id: " + user.getUserId());
        int result = userService.deleteUser(id);
        if (result == 1) {
            // 删除成功
            Res.success(resp, null);
        } else {
            // 删除失败
            Res.error(resp, "Delete user failed");
        }
    }
}
