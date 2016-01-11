package com.authority.dao;

import java.util.Map;

public interface IPager {

	Integer getLimit();

	Integer getPage();

	String getSort();

	String getOrder();

	Map getParams();

	Integer getStart();

}
