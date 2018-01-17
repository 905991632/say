package com.tutor.service;

import java.util.List;

import com.tutor.entity.Collectarticle;

public interface CollectArticleService {

	int addCollectArticle(Collectarticle collectarticle);
	
	int deleteCollectArticle(int id);
	
	int updateByPrimaryKeySelective(Collectarticle collectarticle);
	
	Collectarticle selectByPrimaryKey(int id);
	
	List<Collectarticle> getCollectarticlesByCondition(Collectarticle collectarticle);
	
}
