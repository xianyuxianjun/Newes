package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.Article;
import com.chenxianyu.newes.Utils.ArticleServlet;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.Res;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/deleteNews")
public class DeleteNewsServlet extends ArticleServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Article article = RequestUtils.getParam(req, Article.class);
        int num = arcitleMapper.deleteArticle(article.getArticleId());
        if (num > 0) {
            // 删除成功
            Res.success(resp, "Delete news success");
        } else {
            // 删除失败
            Res.error(resp, "Delete news failed");
        }
    }
}
