package com.xfh.model;

import org.junit.ClassRule;

import javax.persistence.*;
import java.util.Collection;
@Entity
@Table(name = "user",schema = "test01")
public class User {
	private Integer id;
	private String username;
	private String userpass;
	private Collection<Essay> essays;

	@Id
	@GeneratedValue(strategy =GenerationType.AUTO)
	@Column(name = "id",nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	@Basic
	@Column(name = "username",nullable = false)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	@Basic
	@Column(name = "userpass",nullable = false)
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}


	@OneToMany(mappedBy = "userById")
	public Collection<Essay> getEssays() {
		return essays;
	}
	public void setEssays(Collection<Essay> essays) {
		this.essays = essays;
	}


	@Override
	public int hashCode() {
		int result = id;
		result = 31 * result + (username != null ? username.hashCode() : 0);
		result = 31 * result + (userpass != null ? userpass.hashCode() : 0);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null || getClass() != obj.getClass()) return false;

		User that = (User) obj;

		if (id != that.id) return false;
		if (username != null ? !username.equals(that.username) : that.username != null) return false;
		if (userpass != null ? !userpass.equals(that.userpass) : that.userpass != null) return false;
		return  true;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", userpass="
				+ userpass + "]";
	}
	
	
}
