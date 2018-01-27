package com.tutor.entity;

import java.util.List;

public class MyObject<E> {
	private int totalPage;
	
	private List<E> list;


	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
