/*
 * 
 */
package com.authority.dao;

import org.hibernate.transform.ResultTransformer;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<M extends Serializable,K extends Serializable> {
    K save(M model);
    void saveOrUpdate(M model);
    void update(M model);
    void deleteObject(M model);
    void delete(K id);
    M get(K id);
    List<String> getMsg();
    void setMsg(String msg);

    Object queryObject(String hql, Object[] args);
    Object queryObject(String hql);

    List list(String hql, Object[] args, String sort, boolean desc, ResultTransformer resultTransformer);

    List list(String hql, Object[] args, ResultTransformer resultTransformer);

    List list(String hql, Object[] args);

    List list(String hql);

    List<Object> page(String hql, Object[] args, String sort, boolean desc, int pageSize, int offset, ResultTransformer resultTransformer);

    List<Object> page(String hql, Object[] args, int pageSize, int offset, ResultTransformer resultTransformer);

    List<Object> page(String hql, int pageSize, int offset);
}
