package com.devpro.enities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseEnity {
	@Column(name = "email", nullable = false)
	private String email;
	@Column(name = "first_name", nullable = false)
	private String first_name;
	@Column(name = "last_name", nullable = false)
	private String last_name;
	@Column(name = "message", nullable = false)
	private String message;
	@Column(name = "request_type", nullable = false)
	private String request_type;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getRequest_type() {
		return request_type;
	}

	public void setRequest_type(String request_type) {
		this.request_type = request_type;
	}

}
