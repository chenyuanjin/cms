package com.authority.service.impl;

import com.authority.dao.AuthorityDao;
import com.authority.dao.IPager;
import com.authority.model.SysAuthorities;
import com.authority.service.AuthorityService;
import com.authority.utils.ListResult;
import com.authority.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service("authorityService")
public class AuthorityServiceImpl extends BaseServiceImpl<SysAuthorities,String> implements AuthorityService {

    @Autowired(required = true)
	private AuthorityDao authorityDao;
    
    
    @Override
    public ListResult<SysAuthorities> getAuthorityList(IPager pager) {
        return authorityDao.getAuthorityList(pager);  
    }

    @Override
    public Boolean addAuthority(SysAuthorities authorities) {
        if(!StringUtil.isNotEmpty(authorities.getId())){
            authorities.setCreateDate(new Date());
        }
        return authorityDao.addAuthority(authorities);  
    }

    @Override
    public Boolean delAuthority(String authorityId) {
        return authorityDao.delAuthority(authorityId);  
    }

    @Override
    public ListResult<SysAuthorities> getAuthorityRes(IPager pager){
        if(pager != null){
            return authorityDao.getAuthorityRes(pager);
        }
        return null;
    }

    @Override
    public Boolean addAuthorityRes(String resIds,String authorityId) {
        String[] resids = resIds.split(",");
        if(resids.length==0){
            return false;
        }
        return authorityDao.addAuthorityRes(resids,authorityId);  
    }

    @Override
    public Boolean delAuthorityRes(String resIds,String authorityId) {
        String[] resids = resIds.split(",");
        if(StringUtil.isNotEmpty(resids)){
            return authorityDao.delAuthorityRes(resids,authorityId);
        }
        return false;  
    }

    @Override
    public Integer countAuthRole(String authId){
        return authorityDao.countAuthRole(authId);
    }

    /*@Autowired(required = true)
    @Qualifier("authorityDao")
    @Override
    public void setBaseDao(BaseDao<SysAuthorities, String> baseDao) {
        this.baseDao = baseDao;
        authorityDao = (AuthorityDao) baseDao;
    }*/
}
