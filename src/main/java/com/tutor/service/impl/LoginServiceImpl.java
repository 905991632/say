package com.tutor.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tutor.dao.LoginMapper;
import com.tutor.entity.Login;
import com.tutor.entity.LoginExample;
import com.tutor.entity.LoginExample.Criteria;
import com.tutor.service.LoginService;

/*
 * 登录注册模块
 */
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMapper loginMapper;
	
	//判断用户名是否已存在
	public boolean isUserNameExist(String username) {
		LoginExample example = new LoginExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<Login> logins = loginMapper.selectByExample(example);
		if(logins.size()>0){
			return true;
		}else {
			return false;
		}
	}

	//添加用户
	public int addUser(Login login) {
		return loginMapper.insert(login);
		
	}

	//登录
	public List<Login> toLogin(Login login) {
		LoginExample example = new LoginExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(login.getUsername());
		criteria.andPasswordEqualTo(login.getPassword());
		criteria.andUsertypeEqualTo(login.getUsertype());
		return loginMapper.selectByExample(example);
	}

	/*
	 * 	更新密码
	 * 	返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Login login) {
		return loginMapper.updateByPrimaryKeySelective(login);
	}

	
	

}
