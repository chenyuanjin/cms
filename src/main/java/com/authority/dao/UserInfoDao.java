package com.authority.dao;

import com.authority.model.SysUsers;
import com.authority.model.UserLoginLog;

public interface UserInfoDao {

	SysUsers getUserByName(String username);

	String addLoginLog(UserLoginLog log);

	void addLogoutLog(String logid);

}
