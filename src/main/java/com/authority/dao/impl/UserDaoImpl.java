package com.authority.dao.impl;

import com.authority.dao.IPager;
import com.authority.dao.UserDao;
import com.authority.model.SysRoles;
import com.authority.model.SysUsers;
import com.authority.utils.ListResult;
import com.authority.utils.StringUtil;
import org.hibernate.HibernateException;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<SysUsers,String> implements UserDao {


    @Override
    public ListResult<SysUsers> getUserDataList(IPager pager) {

        SysUsers users = this.getUser();
        String hql = "";
        if(users != null && !users.isSys()){
            hql = "  and u.creator.id ='"+users.getId()+"'";
        }
        if(StringUtil.isNotEmpty(pager.getParams().get("userName"))){
            hql += " and u.userName like '%"+ pager.getParams().get("userName")+"%'";
        }
        if(StringUtil.isNotEmpty(pager.getParams().get("userAccount"))){
            hql += " and u.userAccount like '%"+ pager.getParams().get("userAccount")+"%'";
        }
        Object isEnabled = pager.getParams().get("isEnabled");
        if(StringUtil.isNotEmpty(isEnabled)){
            if(isEnabled.toString().equals("1"))
            {
                hql += " and u.enabled=true";
            }else if(isEnabled.toString().equals("0")){
                hql += " and u.enabled=false";
            }
        }

        Object locked = pager.getParams().get("isAccountNonLocked");
        if(StringUtil.isNotEmpty(locked)){
            if(locked.toString().equals("1")){
                hql += " and u.accountNonLocked = true";
            }else{
                hql += " and u.accountNonLocked = false";
            }
        }

        if(StringUtil.isNotEmpty(hql.trim())){
            hql = "where " + hql.replaceFirst("and","");
        }

        ListResult result = null;

        Long count =null;

        if(StringUtil.isNotEmpty(hql)){
            count = (Long) queryObject("select count(*) from SysUsers u " + hql);
        }else{
            count = (Long) queryObject("select count(*) from SysUsers u ");
        }

      /*  String order = "";
        if(StringUtil.isNotEmpty(pager.getOrder()) && StringUtil.isNotEmpty(pager.getSort())){
            order += " order by "+pager.getSort()+" "+pager.getOrder()+" ";
        }*/

        boolean desc = "desc".equals(pager.getOrder())? true : false;

        if(count!=null && count>0){
            result = new ListResult();
            result.setCount(count);
            String sql = "select " +
                    "u.id as id," +
                    "u.enabled as enabled," +
                    "u.userType as userType," +
                    "u.userAccount as userAccount," +
                    "u.userName as userName," +
                    "u.user_roles.size as userRole," +
                    "u.accountNonLocked as  accountNonLocked, " +
                    "u.job as job,"+
                    "u.creator.userName as creator,"+
                    "DATE_FORMAT(u.createDate,'%Y-%m-%d') as createDate"+
                    "  from SysUsers u " + hql;
            List list = this.page(sql,null,pager.getSort(),desc,pager.getLimit(),pager.getStart(),Transformers.ALIAS_TO_ENTITY_MAP);
          /*  Query query = session.createQuery("select " +
                    "u.id as id," +
                    "u.enabled as enabled," +
                    "u.userType as userType," +
                    "u.userAccount as userAccount," +
                    "u.userName as userName," +
                    "u.user_roles.size as userRole," +
                    "u.accountNonLocked as  accountNonLocked, " +
                    "u.job as job,"+
                    "u.creator.userName as creator,"+
                    "DATE_FORMAT(u.createDate,'%Y-%m-%d') as createDate"+
                    "  from SysUsers u " + hql + order)
                    .setMaxResults(pager.getLimit())
                    .setFirstResult(pager.getStart())
                    .setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);*/
            result.setDataList(list);
        }
        return result;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean addUser(SysUsers users) {
        users.setSys(false);
//      新建用户信息
        if(!StringUtil.isNotEmpty(users.getId())){
            String hql = " from SysUsers u where u.userName = ? ";
            Object[] args ={
                    users.getUsername()
            };
            /*Query query = getSession().createQuery("from SysUsers u where u.userName=:username");
            query.setString("username",users.getUsername());*/
            users.setAccountNonExpired(true);
            users.setAccountNonLocked(true);
            users.setCredentialsNonExpired(true);
            users.setEnabled(true);
            if(StringUtil.isNotEmpty(users.getUserPassword())){
                String password = StringUtil.getM5dString(users.getUserPassword());
                if(StringUtil.isNotEmpty(password)){
                    users.setUserPassword(password);
                }
            }
            if(list(hql,args).size()==0){
                try{
                    this.save(users);
                    return true;
                }catch (HibernateException e){
                    e.printStackTrace();
                }
            }
//      修改用户信息
        }else{
            SysUsers SysUsers = (SysUsers) getSession().get(SysUsers.class,users.getId());
            if(SysUsers != null){
//              只允许修改用户的部分信息
//              如果有密码，判断密码是否符合要求
                if(StringUtil.isNotEmpty(users.getUserPassword()) && users.getUserPassword().trim().length()>=6 && users.getUserPassword().trim().length()<=16){
                    String password = StringUtil.getM5dString(users.getUserPassword());
                    SysUsers.setUserPassword(password);
                }else if(StringUtil.isNotEmpty(users.getUserPassword())){
                    return false;
                }
//              SysUsers.setEnabled(users.isEnabled());
                SysUsers.setUserType(users.getUserType());
                SysUsers.setUserName(users.getUserName());
                SysUsers.setJob(users.getJob());
                SysUsers.setSys(false);
                try{
                    this.update(SysUsers);
                    return true;
                }catch (HibernateException e){
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    @Override
    public Boolean delUserById(String userid) {
//        Query query = getSession().createQuery("delete from SysUsers where id=:id");
        SysUsers users = (SysUsers) getSession().get(SysUsers.class,userid);
        if(users != null && !users.isSys()){
            getSession().delete(users);
            return true;
        }
//
//        query.setString("id",userid);
//        if(query.executeUpdate()==1){
//            return true;
//        }
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean addUserRole(String[] roleIds, String userid) {
        String hql = "select u.user_roles.size from SysUsers u where u.id = ?";
        Object[] args ={
                userid
        };
        Integer count = (Integer) queryObject(hql,args);
        /*getSession().createQuery("select u.user_roles.size from SysUsers u where u.id=:userid")
                .setString("userid",userid).uniqueResult();*/
        List roleList = null;
        if(count != null){
            if(count>0){
                roleList = getSession().createQuery("from SysRoles r where r.id in (:roleIds) and r.id not in (select ur.id from SysUsers u left join u.user_roles ur where u.id=:userid)")
                        .setString("userid",userid)
                        .setParameterList("roleIds",roleIds).list();

            }else{
                roleList = getSession().createQuery("from SysRoles r where r.id in (:roleIds)").setParameterList("roleIds",roleIds).list();
            }
        }

        if(roleList != null && roleList.size()>0 ){
            SysUsers users = (SysUsers) getSession().get(SysUsers.class,userid);
            if(users != null){
                try{
                    if(users.getUser_roles() != null){
                        users.getUser_roles().addAll(roleList);
                    }else{
                        users.setUser_roles(roleList);
                    }
                    getSession().flush();
                    return true;
                }catch (HibernateException e){
                    e.printStackTrace();
                }
            }
        }
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean delUserRole(String[] roleIds, String userid) {

        List<SysRoles> roleList =  getSession().createQuery("select r from SysUsers u left join u.user_roles r where r.id in (:roleIds) and u.id=:userid")
                .setParameterList("roleIds", roleIds)
                .setString("userid", userid).list();
        if(roleList != null && roleList.size()>0){
            SysUsers users = (SysUsers) getSession().get(SysUsers.class,userid);
//            if(users != null && !users.isSys()){
            for(SysRoles roles:roleList){
                users.getUser_roles().remove(roles);
                roles.getRole_users().remove(users);
                getSession().update(users);
            }
            return true;
//            }
        }
        return false;
    }

    @Override
    public ListResult<SysUsers> getUserRole(IPager pager) {
//        String userid = null;
        ListResult<SysUsers> listResult = null;
        String userid = (String) pager.getParams().get("userId");
        String hql1 = "select u.user_roles.size from SysUsers u where u.id = ?";
        Object[] args1 = {
                userid
        };
        Integer size = (Integer) queryObject(hql1,args1);
        /*getSession().createQuery("select u.user_roles.size from SysUsers u where u.id=:userid")
                .setString("userid", userid)
                .uniqueResult();*/
        if(size != null && size>0){
            listResult = new ListResult<>();
            listResult.setCount(size);
            String hql2 = "select " +
                    "ur.id as id," +
                    "ur.roleName as roleName," +
                    "ur.roleDesc as roleDesc," +
                    "ur.role_authorities.size as atuhoritySize," +
                    "DATE_FORMAT(ur.createDate,'%Y-%m-%d') as createDate," +
                    "ur.enabled as enabled" +
                    " from SysUsers u left join u.user_roles ur where u.id = ?";
            List dataList = this.page(hql2,args1,pager.getLimit(),pager.getStart(),Transformers.ALIAS_TO_ENTITY_MAP);
            listResult.setDataList(dataList);
        }
        return listResult;
    }

    @Override
    public Boolean changePassword(String oldpassword, String newpassword) {
        if(getUser() != null){
            SysUsers users = get(getUser().getId());
            if(users != null){
                String md5old = StringUtil.getM5dString(oldpassword);
                if(md5old.equals(users.getUserPassword())){
                    users.setUserPassword(StringUtil.getM5dString(newpassword));
                    save(users);
                    return true;
                }
            }
        }
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean updateEnableUser(String userid) {
        SysUsers SysUsers = this.get(userid);
        if(SysUsers != null){
            SysUsers.setEnabled(!SysUsers.isEnabled());
            this.update(SysUsers);
            return true;
        }
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Boolean updateLockUser(String userid) {
        SysUsers SysUsers = this.get(userid);
        if(SysUsers != null){
            SysUsers.setAccountNonLocked(!SysUsers.isAccountNonLocked());
            this.update(SysUsers);
            return true;
        }
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List getUserByType(String type) {
        SysUsers users = getUser();
        if(users != null){
            String hql = "select u.userName as userName, u.id as id from SysUsers u where u.job= ?";
            Object[] args ={
                    new Integer(type)
            };
            return  list(hql,args,Transformers.ALIAS_TO_ENTITY_MAP);
            /*return getSession().createQuery("select u.userName as userName, u.id as id from SysUsers u where u.job=:job")
                    .setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP)
                    .setInteger("job",new Integer(type))
                    .list();*/
        }
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public boolean accountUniqueValidate(String userid, String account) {
        if(StringUtil.isNotEmpty(userid)){
            String hql = "select count(*) from SysUsers u where u.id != ? and u.userAccount = ? ";
            Object[] args ={
                    userid,
                    account
            };
            Long count = (Long) queryObject(hql,args);
            /*getSession().createQuery("select count(*) from SysUsers u where u.id!=:id and u.userAccount=:account ")
                    .setString("id",userid)
                    .setString("account",account)
                    .uniqueResult();*/
            if(count!=null&&count==0){
                return true;
            }
        }else{
            String hql = "select count(*) from SysUsers u where  u.userAccount = ?";
            Object[] args ={
                    account
            };
            Long count = (Long) queryObject(hql,args);
           /* Long count = (Long) getSession().createQuery("select count(*) from SysUsers u where  u.userAccount=:account ")
                    .setString("account",account)
                    .uniqueResult();*/
            if(count!=null&&count==0){
                return true;
            }
        }
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
