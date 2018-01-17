package com.tutor.service;

import java.util.List;

import com.tutor.entity.Login;

public interface LoginService {
	boolean isUserNameExist(String username);
	
	int addUser(Login login);
	
	List<Login> toLogin(Login login);
	
	int updateByPrimaryKeySelective(Login login);
	
}
