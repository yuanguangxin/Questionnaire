package com.service;

import com.mapper.AdminMapper;
import com.models.Admin;
import com.models.AdminExample;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.List;

public class AdminService {
    private AdminMapper adminMapper;

    public AdminMapper getAdminMapper() {
        return adminMapper;
    }

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    public Admin login(String username, String password){
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andUsernameEqualTo(username).andPasswordEqualTo(password);
        List<Admin> list = adminMapper.selectByExample(adminExample);
        if(list.size()==0) return null;
        else return list.get(0);
    }

    public List<Admin> getAllAdmin(){
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andIdIsNotNull();
        List<Admin> list = adminMapper.selectByExample(adminExample);
        return list;
    }

    public List<Admin> getSelectAdmin(String message){
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andUsernameLike("%"+message+"%");
        List<Admin> list = adminMapper.selectByExample(adminExample);
        return list;
    }

    public void addAdmin(Admin admin){
        adminMapper.insert(admin);
    }

    public void deleteAdmin(int id){
        adminMapper.deleteByPrimaryKey(id);
    }
}