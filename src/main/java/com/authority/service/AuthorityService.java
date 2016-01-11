package com.authority.service;

import com.authority.dao.IPager;
import com.authority.model.SysAuthorities;
import com.authority.utils.ListResult;


public interface AuthorityService extends BaseService<SysAuthorities,String> {

    ListResult<SysAuthorities> getAuthorityList(IPager pager);
    Boolean addAuthority(SysAuthorities authorities);

    Boolean delAuthority(String authorityId);

    ListResult<SysAuthorities> getAuthorityRes(IPager pager);

    Boolean addAuthorityRes(String resIds, String authorityId);

    Boolean delAuthorityRes(String resIds, String authorityId);

    Integer countAuthRole(String authId);
}
