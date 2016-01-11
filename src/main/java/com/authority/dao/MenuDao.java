package com.authority.dao;

import com.authority.model.SysMenus;
import com.authority.utils.ListResult;

public interface MenuDao extends BaseDao<SysMenus, String>{
    ListResult<SysMenus> list(IPager pager);
    ListResult<SysMenus> listSon(IPager pager);
    Boolean add(SysMenus menus);
    Boolean edit(SysMenus menus);
}
