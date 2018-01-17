package com.tutor.service;

import java.util.List;

import com.tutor.entity.Article;

public interface ArticleService {

	int addArticle(Article article);
	
	int deleteArticle(int id);
	
	int updateByPrimaryKeySelective(Article article);
	
	List<Article> getArticlesByCondition(Article article);
	
	Article selectByPrimaryKey(int id);
	
}
