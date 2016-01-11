package com.authority.service;

import com.authority.dao.IPager;
import com.authority.model.SysUsers;
import com.authority.utils.ListResult;

import java.util.List;

public interface UserService extends BaseService<SysUsers,String>{
    ListResult getUserData(IPager pager);

    Boolean addUser(SysUsers users);

    Boolean delUserById(String userid);

    Boolean addUserRole(String roleIds, String userid);
    Boolean delUserRole(String roleIds, String userid);


    ListResult getUserRole(IPager pager);


    Boolean saveUserPassword(String oldpassword, String newpassword);

    Boolean updateEnableUser(String userid);

    Boolean updateLockUser(String userid);

    List getUserByType(String type);

    boolean accountUniqueValidate(String userid, String account);

}