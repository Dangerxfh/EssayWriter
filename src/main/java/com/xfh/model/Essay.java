package com.xfh.model;

import javax.persistence.*;

@Entity
@Table(name="essay",schema="test01")
public class Essay {
	private int id;
	private String e_title;
	private String e_content;
	private String e_date;
	private Integer e_likes;
	private  User userById;

	@Id
	@GeneratedValue(strategy =GenerationType.AUTO)
	@Column(name="id",nullable=false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Basic
	@Column(name="e_title",nullable=false)
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	@Basic
	@Column(name="e_content",nullable=false)
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}

	@Basic
	@Column(name="e_date",nullable=false)
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	@Basic
	@Column(name = "e_likes")
	public Integer getE_likes() {
		return e_likes;
	}

	public void setE_likes(Integer e_likes) {
		this.e_likes = e_likes;
	}

	@ManyToOne
	@JoinColumn(name = "user_id",referencedColumnName = "id")
	public User getUserById() {
		return userById;
	}
	public void setUserById(User userById) {
		this.userById = userById;
	}

	@Override
	public int hashCode() {
		int result=id;
		result = 31 * result + (e_date != null ? e_date.hashCode() : 0);
		result = 31 * result + (e_content != null ? e_content.hashCode() : 0);
		result = 31 * result + (e_title!= null ? e_title.hashCode() : 0);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if(this==obj)
			return true;
		if(obj==null || getClass()!=obj.getClass())
			return false;
		Essay that = (Essay) obj;

		if (id != that.id) return false;
		if (e_title != null ? !e_title.equals(that.e_title) : that.e_title != null) return false;
		if (e_content != null ? !e_content.equals(that.e_content) : that.e_content != null) return false;
		if (e_date != null ? !e_date.equals(that.e_date) : that.e_date!= null) return false;

		return true;
	}
}
