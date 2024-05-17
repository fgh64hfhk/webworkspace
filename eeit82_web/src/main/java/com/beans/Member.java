package com.beans;

public class Member {
	private static int nextId = 1;
	private int id;
	private String account, password, realname;

	static {

	}

	public Member() {
		super();
		this.id = nextId++;
	}

	// 新增一個靜態方法，用於設置初始ID值（如果需要）
	public static void setInitialId(int initialId) {
		nextId = initialId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", account=" + account + ", realname=" + realname + "]";
	}

}
