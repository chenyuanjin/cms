package com.authority.model;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "sys_role_menus")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Entity
public class SysRoleMenus implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	@Column(name = "id")
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Id
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	private Integer ind;

	@Column(name = "ind")
	@Basic
	public Integer getInd() {
		return ind;
	}

	public void setInd(Integer index) {
		this.ind = index;
	}

	private boolean enable;

	@Column(name = "enable")
	@Basic
	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		SysRoleMenus that = (SysRoleMenus) o;

		if (enable != that.enable)
			return false;
		if (ind != that.ind)
			return false;
		if (id != null ? !id.equals(that.id) : that.id != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = id != null ? id.hashCode() : 0;
		result = 31 * result + ind;
		result = 31 * result + (enable ? 1 : 0);
		return result;
	}

	private SysMenus menu;

	@OneToOne
	@JoinColumn(name = "menu_id", referencedColumnName = "id")
	public SysMenus getMenu() {
		return menu;
	}

	public void setMenu(SysMenus menu) {
		this.menu = menu;
	}

	private SysRoles role;

	@OneToOne
	@JoinColumn(name = "role_id", referencedColumnName = "id")
	public SysRoles getRole() {
		return role;
	}

	public void setRole(SysRoles role) {
		this.role = role;
	}

}
