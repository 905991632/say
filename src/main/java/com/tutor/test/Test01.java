package com.tutor.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.fastjson.JSONObject;
import com.tutor.dto.LoadJson;
import com.tutor.service.LoginService;

public class Test01 {
	
//	private ApplicationContext applicationContext;
//	
//	@Before
//	public void setUp()throws Exception{
//		applicationContext = new ClassPathXmlApplicationContext("classpath:resources/spring-mybatis.xml");
//	}
	
//	@Autowired
//	Login login;
	
	@Autowired
	LoginService loginService;
	
	
	@Test
	public void test01(){
		//http://ip.ws.126.net/ipquery?ip=
		//http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=
		LoadJson loadJson = new LoadJson();
		String json = loadJson.getAddressJson("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=");
		JSONObject jsonObject=JSONObject.parseObject(json);
		System.out.println(jsonObject.get("country"));
		System.out.println(jsonObject.get("province"));
		System.out.println(jsonObject.get("city"));
	}
	
	
	//分页
	
	
	
	
	
	
	
	
}
