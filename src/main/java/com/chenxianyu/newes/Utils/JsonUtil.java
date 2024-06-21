package com.chenxianyu.newes.Utils;

import com.google.gson.Gson;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

public class JsonUtil {

    public static Map<String, String> getJsonParams(HttpServletRequest req) throws IOException {
        // 从请求体获取 JSON 数据
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = req.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line).append('\n');
            }
        }

        String json = sb.toString();

        // 使用 Gson 库解析 JSON 数据
        Gson gson = new Gson();
        return gson.fromJson(json, Map.class);
    }
}