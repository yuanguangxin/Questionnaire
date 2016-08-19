package com.service;

import com.mapper.UserMapper;
import com.models.User;
import com.models.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public boolean checkUsername(String username){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<User> list = userMapper.selectByExample(userExample);
        if(list.size()==0) return true;
        else return false;
    }

    public void register(User user){
        userMapper.insert(user);
    }

    public User login(String username,String password){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(username).andPasswordEqualTo(password);
        List<User> list = userMapper.selectByExample(userExample);
        if(list.size()==0) return null;
        else return list.get(0);
    }

    public int[] getUserByName(String name){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameLike("%"+name+"%");
        List<User> list = userMapper.selectByExample(userExample);
        int[] ids = new int[list.size()];
        for (int i=0;i<list.size();i++){
            ids[i] = list.get(i).getId();
        }
        return ids;
    }

    public String[] getNames(int[] ids){
        String[] s = new String[ids.length];
        for (int i=0;i<s.length;i++){
            User user = userMapper.selectByPrimaryKey(ids[i]);
            s[i] = user.getName();
        }
        return s;
    }
}
