package com.authority.handler;

import com.authority.model.SysUsers;
import com.authority.model.UserLoginLog;
import com.authority.service.UserInfoService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

public class MyLoginSuccessHandler implements AuthenticationSuccessHandler {

	private static Logger logger = Logger.getLogger( MyLoginSuccessHandler.class);

	@Autowired
	private UserInfoService userInfoService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse,
			Authentication authentication) throws IOException, ServletException {
		SysUsers users = null;
		Object user = SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		if (user != null && user instanceof SysUsers) {
			users = (SysUsers) user;
			httpServletResponse.sendRedirect("home");
			UserLoginLog log = new UserLoginLog();
			log.setLoginIp(httpServletRequest.getRemoteAddr());
			log.setLoginPort(httpServletRequest.getRemotePort());
			log.setLoginLocalPort(httpServletRequest.getLocalPort());
			log.setLoginTime(new Date());
			log.setUserId(users.getId());
			log.setUserName(users.getUserName());
			log.setUserAgent(httpServletRequest.getHeader("User-Agent"));
			String logid = userInfoService.addLoginLog(log);
			HttpSession session = httpServletRequest.getSession();

			logger.debug("logid "+logid);
			if (logid != null && session != null) {
				session.setAttribute("USER_LOGIN_SUCCESS_ID", logid);
				session.setAttribute("username", ((SysUsers) user).getUserName());
			}
		}
	}

}
