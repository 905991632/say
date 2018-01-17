package com.tutor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tutor.dao.ArticleMapper;
import com.tutor.entity.Article;
import com.tutor.entity.ArticleExample;
import com.tutor.entity.ArticleExample.Criteria;
import com.tutor.service.ArticleService;

/*
 *  论坛写文章模块
 */
@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired 
	ArticleMapper articleMapper;
	
	/*
	 * 	添加文章实体类
	 * 	返回1
	 */
	@Override
	public int addArticle(Article article) {
		return articleMapper.insertSelective(article);
	}

	/*
	 * 	删除文章实体类
	 * 	返回1
	 */	
	@Override
	public int deleteArticle(int id) {
		// TODO Auto-generated method stub
		return articleMapper.deleteByPrimaryKey(id);
	}

	/*
	 * 	更新文章实体类
	 * 	返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Article article) {
		return articleMapper.updateByPrimaryKeySelective(article);
	}

	/*
	 * 	筛选文章实体类
	 * 	返回文章实体列表
	 */
	@Override
	public List<Article> getArticlesByCondition(Article article) {
		ArticleExample example = new ArticleExample();
		Criteria criteria = example.createCriteria();
		if(article.getId()!=null){
			criteria.andIdEqualTo(article.getId());
		}
		if(article.getUserid()!=null){
			criteria.andUseridEqualTo(article.getUserid());
		}
		if(article.getTitle()!=null){
			criteria.andTitleLike("%"+article.getTitle()+"%");
		}
		example.setOrderByClause("createTime desc");
		return articleMapper.selectByExample(example);
	}

	/*
	 * 通过id获取实体类
	 * 返回实体类
	 */
	@Override
	public Article selectByPrimaryKey(int id) {
		return articleMapper.selectByPrimaryKey(id);
	}
	
	
}
