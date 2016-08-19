package com.controller;

import com.models.Admin;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    public AdminService getAdminService() {
        return adminService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping("/getSelectAdmin")
    public String getSelectAdmin(@RequestParam(value = "message")String message,
                                 HttpServletRequest request){
        List<Admin> admins = adminService.getSelectAdmin(message);
        request.setAttribute("message",message);
        request.setAttribute("admins",admins);
        return "admin_manage.jsp";
    }

    @RequestMapping("/getAllAdmin")
    public String getAllAdmin(HttpServletRequest request){
        List<Admin> list = adminService.getAllAdmin();
        request.setAttribute("admins",list);
        request.setAttribute("message","");
        return "admin_manage.jsp";
    }

    @RequestMapping("/addAdmin")
    public String addAdmin(Admin admin){
        adminService.addAdmin(admin);
        return "redirect:/admin.jsp";
    }

    @RequestMapping("/deleteAdmin")
    public void deleteAdmin(@RequestParam(value = "delId")String delId){
        adminService.deleteAdmin(Integer.parseInt(delId));
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.setAttribute("admin",null);
        return "redirect:login.html";
    }
}
