package com.authority.service;

import com.authority.dao.IPager;
import com.authority.model.SysMenus;
import com.authority.utils.ListResult;

public interface MenuService extends BaseService<SysMenus,String> {
    ListResult<SysMenus> list(IPager pager);
    Boolean add(SysMenus menus);
    Boolean edit(SysMenus menus);
}
