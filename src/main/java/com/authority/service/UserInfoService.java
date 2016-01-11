package com.authority.service;

import com.authority.model.UserLoginLog;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserInfoService  extends UserDetailsService{

	String addLoginLog(UserLoginLog log);

	void addLogoutLog(String logid);

}
