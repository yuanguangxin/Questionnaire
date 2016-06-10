package com.service;

import com.mapper.AdminMapper;
import com.models.Admin;
import com.models.AdminExample;
import java.util.List;

public class AdminService {
    private AdminMapper adminMapper;

    public AdminMapper getAdminMapper() {
        return adminMapper;
    }

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    public Admin login(Admin admin){
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andUsernameEqualTo(admin.getUsername()).andPasswordEqualTo(admin.getPassword());
        List<Admin> list = adminMapper.selectByExample(adminExample);
        if(list.size()==0) return null;
        else return list.get(0);
    }
}