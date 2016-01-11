/*
 * 
 */
package com.authority.service.impl;

import com.authority.dao.IPager;
import com.authority.dao.LoginLogDao;
import com.authority.model.UserLoginLog;
import com.authority.service.LoginLogService;
import com.authority.utils.ListResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginLogService")
public class LoginLogServiceImpl extends BaseServiceImpl<UserLoginLog,String> implements LoginLogService{
    @Autowired(required = true)
    private LoginLogDao loginLogDao;


    /*@Autowired(required = true)
    @Qualifier("loginLogDao")
    @Override
    public void setBaseDao(BaseDao<UserLoginLog, String> baseDao) {
        this.baseDao = baseDao;
        this.loginLogDao = (LoginLogDao) baseDao;
    }*/

    @Override
    public ListResult<UserLoginLog> list(IPager pager) {
        return loginLogDao.list(pager);
    }
}
