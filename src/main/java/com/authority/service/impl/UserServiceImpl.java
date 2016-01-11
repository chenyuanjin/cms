/*
 * 
 */
package com.authority.service.impl;

import com.authority.dao.IPager;
import com.authority.dao.UserDao;
import com.authority.model.SysUsers;
import com.authority.service.UserService;
import com.authority.utils.ListResult;
import com.authority.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<SysUsers,String> implements UserService {

    @Autowired(required = true)
    private UserDao userManagerDao;

    @Override
    public ListResult getUserData(IPager pager) {
        return userManagerDao.getUserDataList(pager);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean addUser(SysUsers users) {
        if(!StringUtil.isNotEmpty(users.getId())){
            users.setCreateDate(new Date());
           // SysUsers creator = userManagerDao.get(getUser().getId());
            users.setCreator(getUser());
        }
        return userManagerDao.addUser(users);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean delUserById(String userid) {
        return userManagerDao.delUserById(userid);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean addUserRole(String roleIds, String userid) {
        String[] roleids = roleIds.split(",");
        if(StringUtil.isNotEmpty(roleids)){
            return userManagerDao.addUserRole(roleids,userid);
        }
        return false;
    }

    @Override
    public Boolean delUserRole(String roleIds, String userid) {
        String[] roleids = roleIds.split(",");
        if(StringUtil.isNotEmpty(roleids)){
            return userManagerDao.delUserRole(roleids,userid);
        }
        return false;
    }

    @Override
    public ListResult getUserRole(IPager pager) {
        return userManagerDao.getUserRole(pager);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean saveUserPassword(String oldpassword, String newpassword) {
        return userManagerDao.changePassword(oldpassword,newpassword);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean updateEnableUser(String userid) {
        return userManagerDao.updateEnableUser(userid);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean updateLockUser(String userid) {
        return userManagerDao.updateLockUser(userid);
    }

    @Override
    public List getUserByType(String type) {
        return userManagerDao.getUserByType(type);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public boolean accountUniqueValidate(String userid, String account) {
        return userManagerDao.accountUniqueValidate(userid,account);  //To change body of implemented methods use File | Settings | File Templates.
    }


   /* @Autowired(required = true)
    @Qualifier("userDao")
    @Override
    public void setBaseDao(BaseDao<SysUsers, String> baseDao) {
        this.baseDao = baseDao;
        this.userManagerDao = (UserDao) baseDao;
    }*/
}
