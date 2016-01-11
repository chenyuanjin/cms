package com.authority.dao;

import com.authority.model.SysResources;
import com.authority.utils.ListResult;

public interface ResManDao extends BaseDao<SysResources, String> {
    ListResult<SysResources> getGroupList(IPager pager);
    Boolean addGroup(SysResources group);
    Boolean addRes(SysResources resources);
    Boolean delGroup(String groupid);
    Boolean delRes(String resid);
}
