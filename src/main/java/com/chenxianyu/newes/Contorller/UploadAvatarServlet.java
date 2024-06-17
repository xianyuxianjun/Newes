package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.UserServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
@MultipartConfig
@WebServlet(urlPatterns = "/uploadAvatar")
public class UploadAvatarServlet extends UserServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Part filePart = req.getPart("avatar"); // 获取上传的文件
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // 获取文件名
            String uploadPath = getServletContext().getRealPath("") + File.separator + "img"; // 设置上传路径
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir(); // 如果目录不存在，创建目录
            filePart.write(uploadPath + File.separator + fileName); // 保存文件
            // 保存文件路径到数据库
            String filePath = "img" + File.separator + fileName;
            // 这里假设你有一个方法可以将文件路径保存到数据库
            userService.updateAvatar(1, filePath);
        } catch (Exception e) {
            e.printStackTrace(); // 输出错误堆栈
        }
    }
}