package com.chenxianyu.newes.Utils;

import com.chenxianyu.newes.Pojo.Result;
import com.google.gson.Gson;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Res {
    private static final Gson gson = new Gson();

    public static void success(HttpServletResponse resp) throws IOException {
        Result result = Result.success();
        String resultJson = gson.toJson(result);
        resp.getWriter().write(resultJson);
    }

    public static void success(HttpServletResponse resp, Object data) throws IOException {
        Result result = Result.success(data);
        String resultJson = gson.toJson(result);
        resp.getWriter().write(resultJson);
    }

    public static void error(HttpServletResponse resp, String message) throws IOException {
        Result result = Result.error(message);
        String resultJson = gson.toJson(result);
        resp.getWriter().write(resultJson);
    }
}