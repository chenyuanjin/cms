package com.authority.dao;

import com.authority.model.UserLoginLog;
import com.authority.utils.ListResult;

public interface LoginLogDao extends BaseDao<UserLoginLog,String> {

    ListResult<UserLoginLog> list(IPager pager);
}
