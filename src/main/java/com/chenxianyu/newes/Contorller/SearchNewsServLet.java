package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.Article;
import com.chenxianyu.newes.Pojo.KeywordDto;
import com.chenxianyu.newes.Utils.ArticleServlet;
import com.chenxianyu.newes.Utils.Res;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.chenxianyu.newes.Utils.RequestUtils.getParam;

@WebServlet(urlPatterns = "/searchNews")
public class SearchNewsServLet extends ArticleServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        KeywordDto keywordDto = getParam(request, KeywordDto.class);
        int offset = keywordDto.getOffset();
        int limit = keywordDto.getLimit();
        String keyword = keywordDto.getKeyword();
        List<Article> articleList = articleService.getArticleListByKeyword(keyword, offset, limit);
        if (articleList == null) {
            Res.error(response, "查询失败");
        } else {
            Res.success(response, articleList);
        }
    }
}