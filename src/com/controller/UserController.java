package com.controller;

import com.models.Admin;
import com.models.User;
import com.service.AdminService;
import com.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    private UserService userService;
    private AdminService adminService;

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public AdminService getAdminService() {
        return adminService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public UserService getUserService() {
        return userService;
    }

    @RequestMapping("/checkUsername")
    public void checkUsername(@RequestParam("username") String username,
                              HttpServletResponse response) throws Exception{
        response.getWriter().print(userService.checkUsername(username));
    }

    @RequestMapping("/register")
    public String register(User user, HttpSession session){
        userService.register(user);
        session.setAttribute("user",user);
        return "login.html";
    }

    @RequestMapping("/loginCheck")
    public void loginCheck(@RequestParam("username")String username,
                             @RequestParam("password")String password,
                             HttpServletResponse response,
                             HttpSession session) throws Exception{
        User user = userService.login(username,password);
        Admin admin = adminService.login(username,password);
        if(user==null&&admin==null){
            response.getWriter().print("wrong");
        }else {
            if(admin==null){
                session.setAttribute("user",user);
            }else {
                session.setAttribute("admin",admin);
            }
        }
    }

    @RequestMapping("/userLogin")
    public String login(HttpSession session){
        if(session.getAttribute("admin")==null){
            return "/getUserSurvey.action";
        }else {
            return "/admin.jsp";
        }
    }
}
