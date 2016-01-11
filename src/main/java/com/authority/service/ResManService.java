package com.authority.service;

import com.authority.dao.IPager;
import com.authority.model.SysResources;
import com.authority.utils.ListResult;


public interface ResManService extends BaseService<SysResources,String> {
    ListResult<SysResources> getGroupList(IPager pager);
    Boolean addGroup(SysResources group);
    Boolean addRes(SysResources resources);
    Boolean delGroup(String groupid);
    Boolean delRes(String resid);
}
