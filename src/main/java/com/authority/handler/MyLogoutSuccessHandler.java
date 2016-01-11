/*
 * 
 */
package com.authority.handler;

import com.authority.service.UserInfoService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


// TODO: Auto-generated Javadoc

/**
 * The Class LogoutSuccessHandler.
 */
public class MyLogoutSuccessHandler implements LogoutSuccessHandler {
	private static Logger logger = Logger.getLogger(MyLogoutSuccessHandler.class);


	@Autowired
	@Qualifier("userInfoService")
	private UserInfoService userInfoService;

	    @Override
	    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {

	    	HttpSession session = httpServletRequest.getSession();
			String logid = (String) session.getAttribute("USER_LOGIN_SUCCESS_ID");
			logger.debug("logout "+logid);
			if(logid != null && session!=null) {
				userInfoService.addLogoutLog(logid);
				session.removeAttribute("USER_LOGIN_SUCCESS_ID");
				session.invalidate();
			}
	        httpServletResponse.sendRedirect("/common/login");
	    }
	}