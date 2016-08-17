package com.handler;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseHandler extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        if (request.getSession().getAttribute("user") == null && request.getSession().getAttribute("admin") == null) {
            request.getRequestDispatcher("/login.html").forward(request, response);
            return false;
        } else return true;
    }
}
