package com.chenxianyu.newes.Service;

import com.chenxianyu.newes.Pojo.Article;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ArticleServiceTest {
    ArticleService articleService = new ArticleService();
    @Test
    void getAricleById() {
        Article article = articleService.getAricleById(11);
        System.out.println(article.toString());
    }

    @Test
    void addNum() {
        articleService.addNum(11);
    }

    @Test
    void getArticleList() {
        List<Article> articleList = articleService.getArticleList();
        System.out.println(articleList.toString());
    }
}