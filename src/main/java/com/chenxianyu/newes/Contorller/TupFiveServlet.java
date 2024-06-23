package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.Article;
import com.chenxianyu.newes.Utils.ArticleServlet;
import com.chenxianyu.newes.Utils.Res;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/tupFive")
public class TupFiveServlet extends ArticleServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Article> articlesList = articleService.getArticleList();
        Res.success(resp, articlesList);
    }
}
