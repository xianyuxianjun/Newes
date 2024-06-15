package com.chenxianyu.newes.Utils;

import com.chenxianyu.newes.Dao.Impl.ArcitleMapperImpl;
import com.chenxianyu.newes.Service.UserService;

import javax.servlet.http.HttpServlet;

public class ArticleServlet extends HttpServlet {
    protected ArcitleMapperImpl arcitleMapper = new ArcitleMapperImpl();
}
