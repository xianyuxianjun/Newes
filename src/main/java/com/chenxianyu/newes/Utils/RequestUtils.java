package com.chenxianyu.newes.Utils;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class RequestUtils {
    public static <T> T getParam(HttpServletRequest req, Class<T> clazz) {
        T object = null;
        try {
            StringBuilder sb = new StringBuilder();
            BufferedReader reader = req.getReader();
            String str;
            while((str = reader.readLine()) != null){
                sb.append(str);
            }
            String json = sb.toString();

            Gson gson = new Gson();
            object = gson.fromJson(json, clazz);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return object;
    }
    public static Map<String, String> getParam(HttpServletRequest req) {
        Map<String, String> params = new HashMap<>();
        Enumeration<String> paramNames = req.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();
            params.put(paramName, req.getParameter(paramName));
        }
        return params;
    }
}