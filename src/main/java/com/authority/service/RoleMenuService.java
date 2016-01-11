package com.authority.service;

import com.authority.model.SysRoleMenus;
import com.authority.utils.ListResult;

public interface RoleMenuService extends BaseService<SysRoleMenus,String> {

    /**
     * 生成角色菜单
     * @param roleId
     * @return
     */
    Boolean createRoleMenu(String roleId);

    /**
     * 加载角色菜单
     * @param roleId
     * @param parentId
     * @return
     */
    ListResult<SysRoleMenus> loadRoleMenu(String roleId, String parentId);
    /**
     * 加载角色菜单 使用QUERY缓存
     * @return
     */
    ListResult<SysRoleMenus> loadRoleMenu(String id);

    /**
     * 菜单上移一位
     * @param roleid
     * @param menuid
     * @return
     */
    Boolean moveUp(String roleid, String menuid);

    /**
     * 菜单下移一位
     * @param roleid
     * @param menuid
     * @return
     */
    Boolean moveDown(String roleid, String menuid);

}
