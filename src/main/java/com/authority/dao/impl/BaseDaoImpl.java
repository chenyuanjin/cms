package com.authority.dao.impl;

import com.authority.dao.BaseDao;
import com.authority.model.SysUsers;
import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.ResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;

// TODO: Auto-generated Javadoc

/**
 * The Class BaseDaoImpl.
 *
 * @param <M> the generic type
 * @param <K> the key type
 */
@Repository
public  class  BaseDaoImpl<M extends Serializable,K extends Serializable> implements BaseDao<M,K> {
    
    /** The limit. */
    private Integer limit;
    
    /** The page. */
    private Integer page;
    
    /** The start. */
    private Integer start;
//    private MSysUsers user;
    /** The msg. */
    private ArrayList<String> msg;

    @Autowired(required = true)
    @Resource(name = "sessionFactory")
    protected  SessionFactory sessionFactory;
    /**
     * Gets the user.
     *
     * @return the user
     */
    public SysUsers getUser(){
        Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(user != null && user instanceof SysUsers){
            return  (SysUsers) user;
        }
        return null;
    }


    /**
     * Instantiates a new base dao impl.
     */
    protected BaseDaoImpl() {
    }

    private Class<M> clz;

    public Class<M> getClz() {
        if (clz == null) {
            //获取泛型的Class对象
            clz = ((Class<M>)
                    (((ParameterizedType) (this.getClass().getGenericSuperclass())).getActualTypeArguments()[0]));
        }
        return clz;
    }

    /**
     * Gets the session.
     *
     * @return the session
     */
    public Session getSession(){
        Session session = null;
        try{
            session = sessionFactory.getCurrentSession();
        }catch (HibernateException e){
            e.printStackTrace();
            session =sessionFactory.openSession();
        }
        return session;
    }

    /**
     * Open session.
     *
     * @return the session
     */
    public Session openSession(){
        return sessionFactory.openSession();
    }

    /**
     * Save.
     *
     * @param model the model
     * @return the k
     */
    @Override
    public K save(M model){
        return (K)getSession().save(model);
    }

    /**
     * Save or update.
     *
     * @param model the model
     */
    @Override
    public void saveOrUpdate(M model){
        getSession().saveOrUpdate(model);
    }
    
    /**
     * Update.
     *
     * @param model the model
     */
    @Override
    public void update(M model){
        getSession().update(model);
    }

    /**
     * Delete object.
     *
     * @param model the model
     */
    @Override
    public void deleteObject(M model){
        getSession().delete(model);
    }
    
    /**
     * Delete.
     *
     * @param id the id
     */
    @Override
    public void delete(K id){
        getSession().delete(get(id));
    }

    /**
     * Gets the.
     *
     * @param id the id
     * @return the m
     */
    @Override
    public M get(K id){
        return (M)getSession().get(getClz(),id);
    }

    /**
     * Gets the limit.
     *
     * @return the limit
     */
    public Integer getLimit() {
        return limit;
    }

    /**
     * Sets the limit.
     *
     * @param limit the new limit
     */
    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    /**
     * Gets the page.
     *
     * @return the page
     */
    public Integer getPage() {
        return page;
    }

    /**
     * Sets the page.
     *
     * @param page the new page
     */
    public void setPage(Integer page) {
        this.page = page;
    }

    /**
     * Gets the start.
     *
     * @return the start
     */
    public Integer getStart() {
        return limit*(page-1);
    }

    /**
     * Sets the start.
     *
     * @param start the new start
     */
    public void setStart(Integer start) {
        this.start = start;
    }

    /**
     * Gets the session factory.
     *
     * @return the session factory
     */
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    /**
     * Sets the session factory.
     *
     * @param sessionFactory the new session factory
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * Gets the msg.
     *
     * @return the msg
     */
    @Override
    public List<String> getMsg() {
        return this.msg;  //To change body of implemented methods use File | Settings | File Templates.
    }

    /**
     * Sets the msg.
     *
     * @param msg the new msg
     */
    @Override
    public void setMsg(String msg) {
        if(this.msg == null){
            this.msg = new ArrayList<>();
        }
        this.msg.add(msg);
    }

    @Override
    public Object queryObject(String hql, Object[] args){
        Query query = getSession().createQuery(hql);
        setParameter(query, args);
        return  query.uniqueResult();

    }

    @Override
    public Object queryObject(String hql){
        return  queryObject(hql,null);
    }

    @Override
    public List list(String hql, Object[] args, String sort, boolean desc, ResultTransformer resultTransformer) {

        hql = initSort(hql, sort, desc);
        Query query = getSession().createQuery(hql);
        if(resultTransformer != null){
            query = query.setResultTransformer(resultTransformer);
        }
        setParameter(query, args);
        List lists = query.list();
        if (lists == null) {
            lists = new ArrayList<>();
        }
        return lists;
    }

    @Override
    public List list(String hql, Object[] args, ResultTransformer resultTransformer) {
        return list(hql, args, null, false,resultTransformer);
    }

    @Override
    public List list(String hql, Object[] args) {
        return list(hql, args, null, false,null);
    }

    @Override
    public List list(String hql) {
        return list(hql, null,null);
    }

    @Override
    public List<Object> page(String hql, Object[] args, String sort, boolean desc, int pageSize, int offset, ResultTransformer resultTransformer) {
        hql = initSort(hql,sort,desc);
        Query query = getSession().createQuery(hql)
                .setMaxResults(pageSize)
                .setFirstResult(offset);

        if(resultTransformer != null){
                     query.setResultTransformer(resultTransformer);
                }
        setParameter(query, args);
        List lists = query.list();
        if (lists == null) {
            lists = new ArrayList<>();
        }
        return lists;
    }

    @Override
    public List<Object> page(String hql, Object[] args, int pageSize, int offset, ResultTransformer resultTransformer) {
        return page(hql, args, null, false, pageSize, offset,resultTransformer);
    }

    @Override
    public List<Object> page(String hql, int pageSize, int offset) {
        return page(hql, null, pageSize, offset,null);
    }



    protected void setParameter(Query query, Object[] args) {
        if (args != null && args.length > 0) {
            int index = 0;
            for (Object arg : args) {
                query.setParameter(index++, arg);
            }
        }
    }

    protected String initSort(String hql, String sort, boolean desc) {
        if (StringUtils.isNotBlank(sort)) {
            hql += " order by " + sort;
        }
        if (desc) {
            hql += " desc ";
        }
        return hql;
    }
}
