package com.controller;

import com.models.Admin;
import com.service.AdminService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
    private AdminService adminService;

    public AdminService getAdminService() {
        return adminService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping("/login")
    public void login(Admin ad, HttpServletResponse response, HttpSession session) throws Exception{
        Admin admin = adminService.login(ad);
        if(admin==null){
            response.getWriter().print("wrong");
        }else {
            session.setAttribute("admin",admin);
        }
    }
}
